class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @user = User.find_by(username: params[:username])
    @current_user = current_user
    @ideas = @user.ideas
  end
end
