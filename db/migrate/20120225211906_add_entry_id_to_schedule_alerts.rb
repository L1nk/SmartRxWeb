class AddEntryIdToScheduleAlerts < ActiveRecord::Migration
  def change
    add_column :schedule_alerts, :entry_id, :integer

  end
end
