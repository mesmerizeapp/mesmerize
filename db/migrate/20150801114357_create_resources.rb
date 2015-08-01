class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.references :idea, index: true
      t.references :user, index: true
      t.string  :title
      t.string  :description
      t.string  :slug

      t.timestamps null: false
    end
  end
end
