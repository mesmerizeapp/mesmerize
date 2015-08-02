class MembershipsController < ApplicationController
  def create
    if Membership.create(team_id: params[:team_id], user_id: params[:team_id])
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    team = Team.find(params[:team_id])

    if current_user.is_admin_of?(team)
      team.membership.remove_member(User.find(params[:user_id])) ? redirect_to root_path : redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def update
    team = Team.find(params[:team_id])

    if current_user.is_admin_of?(team)
      team.membership.find_by(user_id: params[:user_id]).update_attribute(team_role: params[:team_role]) ? redirect_to root_path : redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
