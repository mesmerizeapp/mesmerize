class ResourcesController < ApplicationController
  before_action :set_idea
  layout 'ideas', except: ['new']

  def index
    @resources = @idea.resources
  end

  def new
  end

  def create
    @idea.resources.create(resource_params.merge!(user_id: current_user.id))

    redirect_to idea_resources_path(user_id: @idea.id)
  end

  def update
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :description, :slug)
  end

  def set_idea
    @idea = Idea.find(params[:idea_id])
  end
end
