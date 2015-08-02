class TeamsController < ApplicationController
  def index
    @teams = current_user.teams
  end

  def show
    @team = Team.find_by(name: params[:team_name])
    @users = @team.users
  end

  def new
  end

  def create
    if current_user.teams.create(team_params)
      redirect_to teams_path, alert: 'Success'
    else
      redirect_to root_path
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :description)
  end
end
