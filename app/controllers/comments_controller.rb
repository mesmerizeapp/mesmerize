class CommentsController < ApplicationController
  def new
  end

  def create
    idea = Idea.find(params[:idea_id])
    current_path = request.path

    if current_path.include?('description')
      idea.description.comments.create(comment_params.merge!(user_id: current_user.id))
      redirect_to idea_description_path(id: params[:idea_id])
    else
      idea.comments.create(comment_params.merge!(user_id: current_user.id))
      redirect_to idea_path(id: params[:idea_id])
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
