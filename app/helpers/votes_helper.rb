module VotesHelper
  def activate_vote(idea)
    'voted' if idea.votes.count != 0 && idea.user != current_user
  end

  def set_action(idea)
    idea.voters.include?(current_user) ? 'DELETE' : 'POST'
  end
end
