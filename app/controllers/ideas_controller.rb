class IdeasController < ApplicationController
  layout 'application', only: [:new, :index]
  before_action :set_idea, except: [:index, :new, :create]
  skip_before_action :authenticate_user!, only: [:index, :show, :description]

  def index
    @ideas = Idea.all
  end

  def show
    @comments = @idea.comments.order('id ASC')
  end

  def new
    @idea = current_user.ideas.new
    @teams = current_user.teams.collect {|team| [team.name, team.id]}
  end

  def create
    if current_user.ideas.create(idea_params)
      redirect_to profile_path(params[:username])
    else
      redirect_to new_idea_path, alert: 'Something went wrong. Please try again.'
    end
  end

  def edit
  end

  def update
    if @idea.update_attributes(idea_params)
      redirect_to profile_path(params[:username])
    else
      redirect_to edit_idea_path(username: params[:username], id: @idea.id), alert: 'Something went wrong. Please try again.'
    end
  end

  def destroy
    @idea.destroy
    redirect_to profile_path(params[:username])
  end

  def description
  end

  def edit_description
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :brief, :description, :team_id)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
