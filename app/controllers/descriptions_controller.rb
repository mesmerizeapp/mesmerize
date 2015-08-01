class DescriptionsController < ApplicationController
  before_action :set_idea
  before_action :set_description

  layout 'ideas'

  def show
    @comments = @description.comments
  end

  def edit
  end

  def update
    @description.update_attribute(:content, description_params[:content])

    redirect_to idea_description_path(username: params[:username], idea_id: @idea.id)
  end

  private

  def description_params
    params.require(:description).permit(:content)
  end

  def set_idea
    @idea = Idea.find(params[:idea_id])
  end

  def set_description
    @description = @idea.description
  end
end
