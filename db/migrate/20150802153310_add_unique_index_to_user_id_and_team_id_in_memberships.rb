class AddUniqueIndexToUserIdAndTeamIdInMemberships < ActiveRecord::Migration
  def change
    add_index :memberships, [:user_id, :team_id], unique: true
  end
end
