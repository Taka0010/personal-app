class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end
  
  def new
    
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:image, :message, :tag).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id]) 
  end
end
