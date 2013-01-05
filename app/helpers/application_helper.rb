module ApplicationHelper
  def get_all_themes
    Enki::Application::ALL_THEMES
  end

  def get_theme(theme)
    get_all_themes[theme.to_sym]
  end

  def get_theme_stylesheet_link

    if !current_user.nil? && !current_user.bootswatch_theme.nil?
      begin
        stylesheet_link_tag current_user.bootswatch_theme, :media => "all"
      rescue
        flash[:alert] = "Could not find user's preferred theme. Defaulting to cyborg"
        stylesheet_link_tag "application_bootstrap_cyborg.css", :media => "all"
        
      end
    else
      stylesheet_link_tag "application_bootstrap_cyborg.css", :media => "all"
    end

  end

  def twitterized_type(type)
    case type
      when :alert
        "alert-block"
      when :error
        "alert-error"
      when :notice
        "alert-info"
      when :success
        "alert-success"
      else
        type.to_s
    end
  end

  def my_menu_items

    # require 'ruby-prof'

    # Profile the code
    # RubyProf.start

    Proc.new do |level_0|

      routes = Rails.application.routes.routes.select {|r| r.usable?}
      # process_recursivly(routes, level_0)

      # primary.item :books, 'Books', 'Books'
      # primary.item :music, 'Music', 'Books'
      # primary.item :dvds, 'Dvds', 'Books' do |dvd_level|
      #   dvd_level.item :the_thing, "The Thing", "things" do |thing_level|
      #     thing_level.item :wilford_symbol, "Wilford Brimley", "diabeetus"
      #   end
      # end

      process_recursivly2(routes, level_0)
    end

    # result = RubyProf.stop

    # # Print a flat profile to text
    # printer = RubyProf::FlatPrinter.new(result)
    # printer.print(STDOUT)
  end

  def process_recursivly2(list, level)
    list.each do |route|

      if !route.get_children.empty?
        level.item route.get_nav_item, route.get_label, route.get_url do |child_level|
          process_recursivly(route.get_children, child_level)
        end
      else
        level.item route.get_nav_item, route.get_label, route.get_url
      end

    end
  end

  def process_recursivly(list, level)

    list.each do |elem|

      children = elem.get_children

      if children
        level.item elem.get_nav_item, elem.get_label, elem.get_url do |child_level|
          process_recursivly(children, child_level)
        end
      else
        level.item elem.get_nav_item, elem.get_label, elem.get_url
      end

    end
  end

end
