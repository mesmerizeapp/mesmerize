class CommentsController < ApplicationController
  def new
  end

  def create
    Idea.find(params[:idea_id]).comments.create(comment_params.merge!(user: current_user))

    redirect_to idea_path(id: params[:idea_id])
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
