class RemoveUserIdFromScheduleAlerts < ActiveRecord::Migration
  def up
    remove_column :schedule_alerts, :user_id
      end

  def down
    add_column :schedule_alerts, :user_id, :integer
  end
end
