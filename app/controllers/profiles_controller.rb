class ProfilesController < ApplicationController
	def index
		@user = User.find_by(username: params[:username])
	end
end
