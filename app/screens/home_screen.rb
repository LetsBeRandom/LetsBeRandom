class HomeScreen < PM::Screen
  title "Home"

  def on_load
    set_nav_bar_button(:right,
                       image: icon_image(:foundation, :widget, size: 18, color: '#606f79'.uicolor),
                       action: :show_help
    ).tap { |btn| set_attributes btn, { accessibilityLabel: 'Help' } }
  end

  def show_help
    open HelpScreen
  end

end
