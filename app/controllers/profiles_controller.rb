class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @user = User.find_by(username: params[:username])
    @ideas = @user.ideas
  end
end
