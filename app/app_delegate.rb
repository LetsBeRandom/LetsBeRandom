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
    hn_fetch_item(:newstories) do |item|
      show item['url'], @window.rootViewController
    end
  end

  def hn_fetch_item(list=:newstories, &block)
    listEntry = 'https://LetsBeRandom.github.io/%s.json' % list

    AFMotion::JSON.get(listEntry) do |result|
      if result.success?
        item = result.object.sample
        block.call(item)
      end
    end
  end

  def show(urlStr, vc)
    url = NSURL.URLWithString urlStr
    svc = SFSafariViewController.alloc.initWithURL(url, entersReaderIfAvailable: true)

    vc.presentViewController(svc, animated: true, completion: nil)
  end
end
