class SettingsController < ApplicationController
  def update
    puts "SETTING: #{params[:theme]}"
    
    if params[:theme]
      current_or_guest_user.settings.theme = params[:theme] 
    end
  
    flash[:notice] = "You have successfully logged out"

                   
    redirect_to :back
  end
end
