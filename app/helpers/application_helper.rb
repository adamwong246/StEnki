module ApplicationHelper
  def get_all_themes
    Enki::Application::ALL_THEMES
  end

  def get_theme(theme)
    get_all_themes[theme.to_sym]
  end

  def get_theme_stylesheet_link

    if current_user && current_user.bootswatch_theme
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

    root = Rails.application.routes.routes.select{|r| r.name == "root" }.first

    if root
      Proc.new do |level_0|
        root.recursive_nav_items(level_0)
        # process_recursivly2(root, level_0)
      end
    else
      raise "Couldn't find a root route. Add a route like < root :to => 'some_controller#some_action' > to your routes.rb"
    end

  end

  # def process_recursivly(list, level)
  #   list.each do |route|

  #     if route.usable?

  #       if !route.get_children.empty?
  #         level.item route.get_nav_item, route.get_label, route.get_url do |child_level|
  #           process_recursivly(route.get_children, child_level)
  #         end
  #       else
  #         level.item route.get_nav_item, route.get_label, route.get_url
  #       end
  #     end
  #   end
  # end

  # def process_recursivly2(route, level)
  #   if route.usable?
  #     if !route.get_children.empty?
  #       level.item route.get_nav_item, route.get_label, route.get_url do |child_level|
  #         process_recursivly(route.get_children, child_level)
  #       end
  #     else
  #       level.item route.get_nav_item, route.get_label, route.get_url
  #     end      
  #   end
  # end
end
