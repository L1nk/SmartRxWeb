class CreateEventConflicts < ActiveRecord::Migration
  def change
    create_table :event_conflicts do |t|
      t.integer :entry1_id
      t.integer :entry2_id

      t.timestamps
    end
  end
end
