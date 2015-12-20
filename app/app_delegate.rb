class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'LetsBeRandom'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    leftBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Random!", style: UIBarButtonItemStylePlain, target: self, action: :randomup)
    rootViewController.navigationItem.leftBarButtonItem = leftBarButtonItem

    true
  end

private
  def randomup
    randomUrl = [
                  "http://blog.liulantao.com/blog/2015/2015-10-04-apache-tcp-backlog.html",
                  "https://www.v2ex.com",
                  "http://lwn.net",
                  "https://news.ycombinator.com/newest"
                ].sample
    show randomUrl, @window.rootViewController
  end

  def show(urlStr, vc)
    NSLog("show " + urlStr)
    url = NSURL.URLWithString urlStr
    svc = SFSafariViewController.alloc.initWithURL(url, entersReaderIfAvailable: true)

    vc.presentViewController(svc, animated: true, completion: nil)
  end
end
