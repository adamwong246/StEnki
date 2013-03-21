class ApplicationController < ActionController::Base

  before_filter :pick_highlight_color

private
  def pick_highlight_color
    if request.fullpath == "/about"
      @highlight_color = "about_colors"
    elsif request.fullpath == "/lab"
      @highlight_color = "lab_colors"
    else
      @highlight_color = "blog_colors"
    end
    
  end
  
  # Automatically reload rails_admin configuration when in development mode
  ########################
  before_filter :reload_rails_admin if :rails_admin_path?

private

  def reload_rails_admin
    models = %W(User UserProfile)
    models.each do |m|
      RailsAdmin::Config.reset_model(m)
    end
    RailsAdmin::Config::Actions.reset

    load("#{Rails.root}/config/initializers/rails_admin.rb")
  end

  def rails_admin_path?
    controller_path =~ /rails_admin/ && Rails.env == "development"
  end
  ###################

  # check_authorization :unless => :devise_controller? # Lock down every controller. Every action must be authorized through cancan

  rescue_from CanCan::AccessDenied do |exception|
    flash[:title] = "Access denied."
    flash[:notice] = "You have insuffecient priveleges to #{exception.action} #{exception.subject}"
    flash[:error] = exception.message

    redirect_to main_app.blog_path
  end


end
