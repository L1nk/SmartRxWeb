class CreateScheduleAlerts < ActiveRecord::Migration
  def change
    create_table :schedule_alerts do |t|
      t.integer :medication_id
      t.integer :user_id
      t.datetime :alert_delta_time
      t.string :alert_type

      t.timestamps
    end
  end
end
