class IdeasController < ApplicationController
  layout 'application', only: [:new]

  def index
    redirect_to profile_path(params[:username])
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = current_user.ideas.new
  end

  def create
    idea = current_user.ideas.build(idea_params)

    if idea.save
      redirect_to profile_path(params[:username])
    else
      redirect_to new_idea_path, alert: 'Something went wrong. Please try again.'
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    hash = {
      title: params[:idea][:title],
      brief: params[:idea][:brief]
    }

    if Idea.find(params[:id]).update_attributes(hash)
      redirect_to profile_path(params[:username])
    else
      redirect_to edit_idea_path(params[:id]), alert: 'Something went wrong. Please try again.'
    end
  end

  def destroy
  end

  def description
    @idea = Idea.find(params[:id])
  end

  def edit_description
    @idea = Idea.find(params[:id])
  end

  def update_description
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :brief, :description)
  end
end
