class CreateTimeBlocks < ActiveRecord::Migration
  def change
    create_table :time_blocks do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.string :frequency
      t.string :days_for_frequency
      t.date :date

      t.timestamps
    end
  end
end
