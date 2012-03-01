class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.string :type
      t.integer :type_id

      t.timestamps
    end
  end
end
