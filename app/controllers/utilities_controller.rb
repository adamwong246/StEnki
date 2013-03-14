class UtilitiesController < ApplicationController
  protect_from_forgery
  check_authorization
  
  # returns the params in a flash message. 
  def flashecho
    authorize! :flashecho, @user


    flash[:title] = "Title: Meditate on this"
    flash[:notice] = "Notice: Cogito ergo."
    flash[:success] = "Successs: But I worry about the"
    flash[:error] = "Error: user. Click OK."
    # flash[:success] = "Success:"

    redirect_to :lab
  end

end