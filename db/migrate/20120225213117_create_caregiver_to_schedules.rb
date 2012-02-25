class CreateCaregiverToSchedules < ActiveRecord::Migration
  def change
    create_table :caregiver_to_schedules do |t|
      t.integer :schedule_id
      t.integer :user_id

      t.timestamps
    end
  end
end
