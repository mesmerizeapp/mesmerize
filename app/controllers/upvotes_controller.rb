class VotesController < ApplicationController
  def create
    idea = Idea.find_by(params[:id])

    if idea.user != current_user
      if Vote.create(user: current_user, idea: idea)
        render json: { success: true }
      else
        render json: { success: false, message: 'Something went wrong. Please try again.' }
      end
    end
  end
end
