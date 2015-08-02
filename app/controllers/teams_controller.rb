class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    team = current_user.teams.create(team_params)
    if team && current_user.memberships(team: team)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :description)
  end
end
