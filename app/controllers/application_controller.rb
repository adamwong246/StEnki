class ApplicationController < ActionController::Base

  # helper_method :current_user
  # helper_method :user_signed_in?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

protected
  def enki_config
    @@enki_config = Enki::Config.default
  end
  helper_method :enki_config


  

  # def current_user
  #   @current_user ||= User.find_by_id(session[:user_id])
  # end

  # def signed_in?
  #   !!current_user
  # end
  # helper_method :current_user, :signed_in?

  # def current_user=(user)
  #   @current_user = user
  #   session[:user_id] = user.nil? ? user : user.id
  # end

  # private  
  #   def current_user  
  #     @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]  
  #   end
    
    # def user_signed_in?
    #   return current_user.nil?
    # end
      
  #   def authenticate_user!
  #     if !current_user
  #       flash[:error] = 'You need to sign in before accessing this page!'
  #       redirect_to signin_services_path
  #     end
  #   end


  
end
