class CommentsController < ApplicationController
  def new
  end

  def create
    comment = Idea.find(params[:id]).comments.new(comment_params)
    comment.user_id = current_user.id
    comment.save
    redirect_to idea_path(id: params[:id])
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
