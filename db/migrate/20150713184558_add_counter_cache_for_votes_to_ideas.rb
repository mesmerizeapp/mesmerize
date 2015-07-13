class AddCounterCacheForVotesToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :vote_count, :integer, default: 0

    Idea.reset_column_information
    Idea.find_each do |idea|
      Idea.update_counters(idea.id, vote_count: idea.votes.length)
    end
  end
end
