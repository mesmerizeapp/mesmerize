class ProfilesController < ApplicationController
  def index
    @user = User.find_by(username: params[:username])
    @ideas = @user.ideas
  end
end
