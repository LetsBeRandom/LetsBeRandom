class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(HomeViewController.new)
    @window.makeKeyAndVisible

    NSURLProtocol.registerClass(RMURLProtocol)

    true
  end
end
