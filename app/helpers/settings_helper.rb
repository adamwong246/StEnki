module SettingsHelper
  def themes
    return Enki::Application::ALL_THEMES
  end

  def current_theme
    Settings.theme
  end

  def get_theme_stylesheet_link

    begin
      attempt = themes[current_theme.to_sym]
      toReturn = stylesheet_link_tag attempt, :media => "all"
    rescue
      instead = themes[:plain]
      puts "instead: #{instead}"
      toReturn = stylesheet_link_tag instead, :media => "all"
    end

    puts "get Theme => #{toReturn.inspect}"
    return toReturn

  end
end
