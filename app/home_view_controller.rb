class HomeViewController < UIViewController
  def loadView
    self.title = "README"._

    self.view = UIView.new
    self.view.backgroundColor = UIColor.whiteColor
  end

  def viewDidLoad
    @action_label = UILabel.new
    @action_label.text = "README:Go"._
    @action_label.sizeToFit

    @action_button = UIButton.buttonWithType UIButtonTypeRoundedRect
    @action_button.setBackgroundImage UIImage.imageNamed('icons/icon-180.png'), forState:UIControlStateNormal

    @action_button.addTarget(self,
      action: :randomup,
      forControlEvents: UIControlEventTouchUpInside)

    subviews = {"randomup_btn" => @action_button, "randomup_label" => @action_label}
    metrics = {"top" => 200, "margin" => 20, "height" => 40, "randomup_btn_height" => 180}

    subviews.values.each do |subview|
      subview.translatesAutoresizingMaskIntoConstraints = false
      self.view.addSubview(subview) unless subview.superview
    end

    begin
      c1 = NSLayoutConstraint.constraintsWithVisualFormat "H:|-(>=margin)-[randomup_btn(==randomup_btn_height@50)]-(>=margin)-|",
        options: 0,
        metrics: metrics,
        views: subviews

      c2 = NSLayoutConstraint.constraintsWithVisualFormat "V:|-top-[randomup_label]-margin-[randomup_btn(==randomup_btn_height)]",
        options: 0,
        metrics: metrics,
        views: subviews

      c3 = NSLayoutConstraint.constraintWithItem @action_label,
        attribute: NSLayoutAttributeCenterX,
        relatedBy: NSLayoutRelationEqual,
        toItem: self.view,
        attribute: NSLayoutAttributeCenterX,
        multiplier: 1, constant:0

      c4 = NSLayoutConstraint.constraintWithItem @action_button,
        attribute: NSLayoutAttributeCenterX,
        relatedBy: NSLayoutRelationEqual,
        toItem: self.view,
        attribute: NSLayoutAttributeCenterX,
        multiplier: 1, constant:0

      self.view.addConstraints [c1, c2, c3, c4].flatten
    end
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
