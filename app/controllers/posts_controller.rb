class PostsController < ApplicationController
  def index
    @tag = params[:tag]
    
    # @posts = Kaminari.paginate_array(Post.find_recent(:tag => @tag, :include => :tags)).page(params[:page]).per(3)

    @posts = Post.paginate(
      :order => "published_at DESC",
      :page  => params[:page],
      :per_page => 3
    )

    respond_to do |format|
      format.html 
      format.atom { render :layout => false }
    end
  end

  def show
    @post = Post.find_by_permalink(*([:year, :month, :day, :slug].collect {|x| params[x] } << {:include => [:approved_comments, :tags]}))
    @comment = Comment.new
  end
end
