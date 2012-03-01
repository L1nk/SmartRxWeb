class CreateScheduleAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :med_event_id
      t.string :alert_type

      t.timestamps
    end
  end
end
