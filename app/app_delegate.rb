class AppDelegate < PM::Delegate
  status_bar true, animation: :fade

  def on_load(app, options)
    return true if RUBYMOTION_ENV == "test"
    open HomeScreen.new(nav_bar: true)

    UINavigationBar.appearance.tintColor = :white.uicolor
    UINavigationBar.appearance.barTintColor = [255, 102, 0].uicolor
    UINavigationBar.appearance.setTitleTextAttributes(
      NSForegroundColorAttributeName => :white.uicolor,
      NSBaselineOffsetAttributeName => 0,
      NSFontAttributeName => 'HelveticaNeue-Bold'.uifont(18)
    )
    UINavigationBar.appearance.setBackIndicatorImage icon_image(:awesome, :arrow_circle_left, size: 18, color: :white.uicolor)
    UINavigationBar.appearance.setBackIndicatorTransitionMaskImage icon_image(:awesome, :arrow_circle_o_left, size: 18, color: :white.uicolor)
  end

end
