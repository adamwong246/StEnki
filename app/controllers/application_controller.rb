class ApplicationController < ActionController::Base
  # check_authorization # Lock down every controller. Every action must be authorized through cancan

  # rescue_from CanCan::AccessDenied do |exception|
  #   flash[:error] = "Access denied."
  #   redirect_to root_url
  # end


end
