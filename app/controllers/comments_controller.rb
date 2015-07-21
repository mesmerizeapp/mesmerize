class CommentsController < ApplicationController
  def new
  end

  def create
    Idea.find(params[:id]).comments.create(comment_params)
    redirect_to idea_path(id: params[:id])
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
