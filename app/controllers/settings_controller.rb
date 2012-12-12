class SettingsController < ApplicationController
  def update
    puts "SETTING: #{params[:theme]}"

    Settings.theme = params[:theme] if params[:theme]

    flash[:notice] = "You have successfully logged out"

                   
    redirect_to :back
  end
end
