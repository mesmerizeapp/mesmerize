class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :team, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :team_role, default: 1

      t.timestamps null: false
    end

    add_index :memberships, [:user_id, :team_id], unique: true
  end
end
