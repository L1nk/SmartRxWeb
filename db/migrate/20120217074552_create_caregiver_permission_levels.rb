class CreateCaregiverPermissionLevels < ActiveRecord::Migration
  def change
    create_table :caregiver_permission_levels do |t|
      t.integer :caregiver_id
      t.integer :user_id
      t.boolean :can_edit_alerts
      t.boolean :can_edit_schedule
      t.boolean :can_edit_time_conflicts
      t.boolean :can_edit_medication_conflicts

      t.timestamps
    end
  end
end
