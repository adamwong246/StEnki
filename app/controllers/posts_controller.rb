class PostsController < ApplicationController
  helper TruncateHtmlHelper

  load_and_authorize_resource

  def index
    @tag = params[:tag]

    @posts = Post.where(:active => true).page(params[:page]).per(3)
    
    # @posts = Kaminari.paginate_array(Post.find_recent(:tag => @tag, :include => :tags)).page(params[:page]).per(3)

    # @posts = Post.paginate(
    #   :order => "published_at DESC",
    #   :page  => params[:page],
    #   :per_page => 3
    # )

    #flash.now[:notice] = "Welcome back #{current_user.email}"
    #flash.now[:alert] = "Welcome back #{current_user.email}"
    #flash.now[:error] = "Welcome back #{current_user.email}"
    #flash.now[:success] = "Welcome back #{current_user.email}"

    respond_to do |format|
      format.html 
      format.atom { render :layout => false }
    end
  end

  def create
    Post.save(params[:post])
  end

  def show

    @post = Post.find_by_permalink(*([:year, :month, :day, :slug].collect {|x| params[x] } << {:include => [:approved_comments, :tags]}))
    @root_comments = @post.comments.select { |x| x.parent.nil? }

    # @json_tree = @root_comments.first.to_json
    # @json_tree = [
    #   {
    #     label: 'node1',
    #     children: [
    #       { label: 'child1' },
    #       { label: 'child2' }
    #     ]
    #   },
    #   {
    #     label: 'node2',
    #     children: [
    #       { label: 'child3' }
    #     ]
    #   }
    # ]




  end
end
