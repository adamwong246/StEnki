class SettingsController < ApplicationController
  def update
    puts "SETTING: #{params[:theme]}"

    Settings.theme = params[:theme] if params[:theme]
    redirect_to :back
  end
end
