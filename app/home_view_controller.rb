class HomeViewController < UIViewController
  def loadView
    self.title = "README"._

    self.view = UIView.new
    self.view.backgroundColor = UIColor.whiteColor
  end

  def viewDidLoad
    @action_button = UIButton.buttonWithType UIButtonTypeRoundedRect
    @action_button.setTitle "README:Go"._, forState: UIControlStateNormal
    @action_button.frame = [[100, 100], [160, 50]]

    @action_button.addTarget(self,
      action: :randomup,
      forControlEvents: UIControlEventTouchUpInside)

    self.view.addSubview @action_button
  end

private
  def randomup
    random_fetch_item(:newstories) do |item|
      show item['url'], self
    end
  end

  def random_fetch_item(list=:newstories, &block)
    listEntry = 'https://Readom.github.io/HackerNewsJSON/%s.json' % list

    AFMotion::JSON.get(listEntry) do |result|
      if result.success?
        item = result.object.sample
        block.call(item) unless item['url'].nil?
      end
    end
  end

  def show(urlStr, vc)
    url = NSURL.URLWithString urlStr
    svc = SFSafariViewController.alloc.initWithURL(url, entersReaderIfAvailable: true)

    vc.presentViewController(svc, animated: true, completion: nil)
  end
end
