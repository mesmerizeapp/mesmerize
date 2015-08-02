class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :team, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :email
      t.string :token
      t.datetime :expires_at
      t.datetime :accepted_at

      t.timestamps null: false
    end
  end
end
