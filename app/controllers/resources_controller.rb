class ResourcesController < ApplicationController
  before_action :set_idea
  layout 'ideas'

  def index
    @resources = @idea.resources
  end

  def new
  end

  def create
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
