class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.references  :idea, index: true
      t.text  :content

      t.timestamps null: false
    end
  end
end
