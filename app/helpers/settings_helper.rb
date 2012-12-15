module SettingsHelper
  def all_themes
    return Enki::Application::ALL_THEMES
  end

  def current_theme_name
    puts "current_user: #{current_or_guest_user}"
    puts "all_themes: #{all_themes.inspect}"
    puts "SETTINGS FOR USER: #{current_or_guest_user.settings.inspect}"

    if current_or_guest_user.settings.theme
      return current_or_guest_user.settings.theme
    else
      return "plain"
    end
  end

  def get_theme_stylesheet_link
    stylesheet_link_tag all_themes[:cyborg], :media => "all"
  end
end
