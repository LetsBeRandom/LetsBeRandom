class RMURLProtocol < NSURLProtocol
  def self.canInitWithRequest(request)
    @@requestCount ||= 0
    NSLog "Request #%u: URL = %@" % [@@requestCount+=1, request.URL.absoluteString]
    return false
  end

  def self.canonicalRequestForRequest(request)
    return request
  end

  def requestIsCacheEquivalent(aRequest, toRequest: bRequest)
    super requestIsCacheEquivalent(aRequest, toRequest:bRequest)
  end

  def startLoading
    @connection = NSURLConnection.connectionWithRequest(self.request, delegate: self)
  end

  def stopLoading
    @connection.cancel unless @connection.nil?
    @connection = nil
  end
end
