class RMURLProtocol < NSURLProtocol
  @@protocolKey ||= 'RMURLProtocolKey'
  @@requestCount ||= 0

  def self.canInitWithRequest(request)
    NSLog "Request #%u: URL = %@" % [@@requestCount+=1, request.URL.absoluteString]

    if NSURLProtocol.propertyForKey @@protocolKey, inRequest:request
      return false
    end

    scheme = request.URL.scheme.lowercaseString
    return scheme.isEqualToString("http") || scheme.isEqualToString("https")
  end

  def self.canonicalRequestForRequest(request)
    return request
  end

  def requestIsCacheEquivalent(aRequest, toRequest: bRequest)
    super requestIsCacheEquivalent(aRequest, toRequest:bRequest)
  end

  def startLoading
    request = self.request.mutableCopy
    NSURLProtocol.setProperty true, forKey:@@protocolKey, inRequest:request
    config = NSURLSessionConfiguration.defaultSessionConfiguration
    config.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData
    config.connectionProxyDictionary = {
      KCFNetworkProxiesHTTPEnable => 1,
      KCFNetworkProxiesHTTPProxy => "42.120.23.151",
      KCFNetworkProxiesHTTPPort => 13128,
      'HTTPSEnable' => 1,
      KCFStreamPropertyHTTPSProxyHost => "42.120.23.151",
      KCFStreamPropertyHTTPSProxyPort => 13128
    }
    m_session = NSURLSession.sessionWithConfiguration config, delegate:self, delegateQueue:NSOperationQueue.currentQueue
    m_session.dataTaskWithRequest(request).resume

    # @connection = NSURLConnection.connectionWithRequest(request, delegate: self)
  end

  def stopLoading
    @connection.cancel unless @connection.nil?
    @connection = nil
  end
end
