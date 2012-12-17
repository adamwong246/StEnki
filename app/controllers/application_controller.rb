class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization

  helper_method :current_user
  helper_method :user_signed_in?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

  private  
    def current_user  
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]  
    end
    
    def user_signed_in?
      return 1 if current_user 
    end
      
    def authenticate_user!
      if !current_user
        flash[:error] = 'You need to sign in before accessing this page!'
        redirect_to signin_services_path
      end
    end

  protected

  def enki_config
    @@enki_config = Enki::Config.default
  end
  helper_method :enki_config


  
end
