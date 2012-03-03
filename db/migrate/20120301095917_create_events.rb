class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :entry_id
      t.string :name
      t.text :description
      t.integer :alert_id
      t.integer :user_id

      t.timestamps
    end
  end
end
