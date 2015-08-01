class VotesController < ApplicationController
  before_action :set_idea

  def create
    render json: { success: false, message: 'You can not upvote your own idea.' } and return if @idea.user == current_user

    if current_user.votes.create(idea: @idea)
      render json: { success: true, votes_count: @idea.votes.count }
    else
      render json: { success: false, message: 'Something went wrong. Please try again.' }
    end
  end

  def destroy
    vote = @idea.votes.find_by(user: current_user)
    render json: { success: false, message: 'Something went wrong. Please try again.' } and return if vote.blank?

    if vote.destroy
      render json: { success: true, votes_count: @idea.votes.count }
    else
      render json: { success: false, message: 'Something went wrong. Please try again.' }
    end
  end

  private

  def set_idea
    @idea = Idea.find(params[:idea_id])
  end
end
