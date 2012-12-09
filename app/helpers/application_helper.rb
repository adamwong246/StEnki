module ApplicationHelper
  def author
    Struct.new(:name, :email).new(enki_config[:author][:name], enki_config[:author][:email])
  end

  def open_id_delegation_link_tags(server, delegate)
    raw links = <<-EOS
      <link rel="openid.server" href="#{server}">
      <link rel="openid.delegate" href="#{delegate}">
    EOS
  end

  def format_comment_error(error)
    {
      'body'   => 'Please comment',
      'author' => 'Please provide your name or OpenID identity URL',
      'base'   => error.last
    }[error.first.to_s]
  end

  def themes
    return Enki::Application::ALL_THEMES#
  end

  def get_theme

    begin
      toReturn = stylesheet_link_tag "#{themes[Settings.theme.to_sym]}.css", :media => "all"
    rescue
      toReturn = stylesheet_link_tag "#{themes[:plain]}.css", :media => "all"
    end

    puts "get Theme => #{toReturn.inspect}"
    return toReturn

    # puts "GET THEME #{Enki::Application::THEMES.inspect}"
    # if Enki::Application::THEMES[Settings.theme.to_sym]
    #   return "application_bootstrap_#{Settings.theme}"# if Enki::Application::THEMES[Settings.theme.to_sym]
    # else
    #   return 'application_bootstrap'
    # end
  end

end
