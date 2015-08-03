class TeamsController < ApplicationController
  def index
    @teams = current_user.teams
  end

  def show
    @team = Team.find_by(name: params[:name])
    @admins = @team.admin_users
    @users = @team.users
    @ideas = @team.ideas
  end

  def new
  end

  def create
    if current_user.teams.create(team_params)
      redirect_to team_path(name: team_params[:name]), alert: 'Success'
    else
      redirect_to teams_path
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :description)
  end
end
