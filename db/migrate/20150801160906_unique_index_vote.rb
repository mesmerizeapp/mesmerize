class UniqueIndexVote < ActiveRecord::Migration
  def change
    add_index :votes, [:user_id, :idea_id], unique: true, name: :unique_votes_index
  end
end
