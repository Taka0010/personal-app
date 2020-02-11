class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(5)
    @post = Post.new
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order("created_at DESC")
  end
  
  def new
    
  end

  def create
    Post.create(post_params)
    redirect_to root_path

    # @post = Post.create(post_params)
    # @post = Post.new(post_params)
    # if @post.save
    #   respond_to do |format|
    #     format.json
    #   end
    # end
  end

  private
  def post_params
    params.require(:post).permit(:image, :tag, :message).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id]) 
  end
end
