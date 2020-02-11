class CommentsController < ApplicationController
  def create
    # Comment.create(comment_params)
    # redirect_to post_path(params[:post_id])
    # redirect_to root_path
    # @comment = Comment.create(comment_params)
    # respond_to do |format|
    #   format.json
    # end
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to post_path(params[:post_id])  }
      format.json
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
  end


end
