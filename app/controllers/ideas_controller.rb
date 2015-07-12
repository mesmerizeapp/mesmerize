class IdeasController < ApplicationController
  layout 'application', only: [:new]
  before_action :set_idea, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show, :description]

  def index
    redirect_to profile_path(params[:username])
  end

  def show
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
  end

  def update
    hash = {
      title: params[:idea][:title],
      brief: params[:idea][:brief]
    }

    if @idea.update_attributes(hash)
      redirect_to profile_path(params[:username])
    else
      redirect_to edit_idea_path(params[:id]), alert: 'Something went wrong. Please try again.'
    end
  end

  def destroy
    @idea.destroy
  end

  def description
  end

  def edit_description
  end

  def update_description
    @idea.update_attribute(:description, params[:idea][:description])

    redirect_to description_path(id: @idea.id)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :brief, :description)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
