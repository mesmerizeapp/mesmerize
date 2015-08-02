class MembershipsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, except: [:new]

  def new

  end

  def create
    if Membership.create(team: @team, user: @user)
      redirect_to team_path(name: @team.name)
    else
      redirect_to team_path(name: @team.name)
    end
  end

  def destroy
    if @team.remove_member(@user)
      redirect_to team_path(name: @team.name)
    else
      redirect_to team_path(name: @team.name)
    end
  end

  def update
    if @team.memberships.find_by(user: @user).update_attribute(team_role: params[:team_role])
      redirect_to team_path(name: @team.name)
    else
      redirect_to team_path(name: @team.name)
    end
  end

  private

  def set_user
    if params[:email_or_username].present?
      @user = User.find_by(email: params[:email_or_username]) || User.find_by(username: params[:username])
    elsif params[:user_id].present?
      @user = User.find_by(id: params[:user_id])
    else
      redirect_to team_path(name: @team.name)
    end
  end

  def authenticate_admin!
    @team = Team.find_by(name: params[:team_name])
    redirect_to root_path if !@team.has_admin?(current_user)
  end
end
