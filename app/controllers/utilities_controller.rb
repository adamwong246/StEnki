class UtilitiesController < ApplicationController
  protect_from_forgery
  check_authorization
  
  # returns the params in a flash message. 
  def flashecho
    authorize! :flashecho, @user


    flash[:title] = "Meditate on this"
    flash[:notice] = "Cogito ergo"
    flash[:success] = "sum. But I worry about"
    flash[:error] = "user. Click OK."
    # flash[:success] = "Success:"

    redirect_to :lab
  end

end