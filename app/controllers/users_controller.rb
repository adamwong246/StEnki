class UsersController < ApplicationController
  respond_to :html, :json
  
  # before_filter :authenticate_user!, :except => [:index]
  # load_and_authorize_resource


  def show
    @user = User.find(params[:id])

    flash.now[:notice] = "Welcome back #{current_user.email}"
   
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html  { redirect_to(@user,
                      :notice => 'Post was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @user.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
  
end