class MembershipsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user

  def create
    if Membership.create(team_id: @team, user: @user)
      redirect_to team_path(team_name: @team.name)
    else
      redirect_to team_path(team_name: @team.name)
    end
  end

  def destroy
    if @team.remove_member(@user)
      redirect_to team_path(team_name: @team.name)
    else
      redirect_to team_path(team_name: @team.name)
    end
  end

  def update
    if @team.memberships.find_by(user: @user).update_attribute(team_role: params[:team_role])
      redirect_to team_path(team_name: @team.name)
    else
      redirect_to team_path(team_name: @team.name)
    end
  end

  private

  def set_user
    if params[:email].present?
      @user = User.find_by(email: params[:email])
    elsif params[:user_id].present?
      @user = User.find_by(id: params[:user_id])
    else
      redirect_to team_path(team_name: @team.name)
    end
  end

  def authenticate_admin!
    @team = Team.find(params[:team_id])
    redirect_to team_path(team_name: @team.name) if !@team.has_admin?(current_user)
  end
end
