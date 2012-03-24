class CreateCaregiverRequests < ActiveRecord::Migration
  def change
    create_table :caregiver_requests do |t|
      t.integer :caregiver_id
      t.string :patient_email

      t.timestamps
    end
  end
end
