class PostsController < ApplicationController
  helper TruncateHtmlHelper

  load_and_authorize_resource

  def archive
    @months = Post.find_grouped_by_month

    respond_to do |format|
      format.html 
    end

  end

  def index

    @tag = params[:tag]

    @posts = Post.where(:active => true).page(params[:page]).per(3)

    respond_to do |format|
      format.html 
      format.atom { render :layout => false }
      format.json{
      render :json => @posts.to_json
    }
    end
  end

  def create
    Post.save(params[:post])
  end

  def show

    @post = Post.find_by_permalink(*([:year, :month, :day, :slug].collect {|x| params[x] } << {:include => [:approved_comments, :tags]}))
    @root_comments = @post.comments.select { |x| x.parent.nil? }

  end
end
