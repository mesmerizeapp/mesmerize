class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user, index: true
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
    add_foreign_key :identities, :users
    add_index :identities, [:user_id, :provider], unique: true
    add_index :identities, [:provider, :uid], unique: true
  end
end
