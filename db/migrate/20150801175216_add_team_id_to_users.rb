class AddTeamIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :team, index: true, foreign_key: true
    add_column :users, :team_role, :string
  end
end
