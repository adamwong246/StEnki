class PagesController < ApplicationController
  def show
    @page = Page.find_by_slug(params[:id]) || raise(ActiveRecord::RecordNotFound)

    render :layout => 'application_fixed'
  end
end
