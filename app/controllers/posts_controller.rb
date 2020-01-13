class PostsController < ApplicationController

  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
    
  end

  def create
    Post.create(post_params)
    redirect_to action: :index
  end

  private
  def post_params
    params.require(:post).permit(:image, :message).merge(user_id: current_user.id)
  end
end
