class IdeasController < ApplicationController
  before_action :authenticate_user!

  def new
    @idea = Idea.new
  end

  def create
    idea = current_user.ideas.build(idea_params)

    if idea.save
      redirect_to root_path
    else
      redirect_to new_idea_path, alert: 'Something went wrong. Please try again.'
    end
  end

  def update
  end

  def destroy
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :brief, :description)
  end
end
