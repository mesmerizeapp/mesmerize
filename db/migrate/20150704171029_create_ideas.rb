class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
    	t.references	:user, index: true
    	t.string			:title, index: true
    	t.string			:description, index: true

      t.timestamps null: false
    end
  end
end
