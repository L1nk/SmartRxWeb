class CreateScheduleAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :event_id
      t.integer :medication_id
      t.string :name
      t.string :alert_type
      t.integer :user_id
      t.boolean :is_dismissed
      t.time :alert_time

      t.timestamps
    end
  end
end
