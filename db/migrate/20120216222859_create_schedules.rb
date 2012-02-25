class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.integer :user_id
      t.string :schedule_name

      t.timestamps
    end
  end

  def self.down
    drop_tabel :schedules
  end
end
