class AddTeamIdToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :team, index: true, foreign_key: true
  end
end
