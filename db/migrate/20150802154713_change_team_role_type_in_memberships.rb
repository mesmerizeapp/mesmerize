class ChangeTeamRoleTypeInMemberships < ActiveRecord::Migration
  def change
    remove_column :memberships, :team_role
    add_column :memberships, :team_role, :integer, default: 1
  end
end
