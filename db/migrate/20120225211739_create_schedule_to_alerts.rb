class CreateScheduleToAlerts < ActiveRecord::Migration
  def change
    create_table :schedule_to_alerts do |t|
      t.integer :schedule_id
      t.integer :alert_id

      t.timestamps
    end
  end
end
