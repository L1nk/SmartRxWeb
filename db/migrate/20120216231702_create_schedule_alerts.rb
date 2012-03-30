class CreateScheduleAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :event_id
      t.integer :schedule_drug_id
      t.string :name
      t.string :alert_type
      t.integer :user_id
      t.boolean :is_dismissed
      t.datetime :alert_time

      t.timestamps
    end
  end
end
