class CreateScheduleToEntries < ActiveRecord::Migration
  def self.up
    create_table :schedule_to_entries do |t|
      t.integer :schedule_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :schedule_to_entries
  end
end
