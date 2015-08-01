module VotesHelper
  def activate_vote(idea)
    'voted' if idea.votes.count != 0
  end

  def set_action(idea)
    idea.voters.include?(current_user) ? 'DELETE' : 'POST'
  end
end
