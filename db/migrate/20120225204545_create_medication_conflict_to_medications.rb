class CreateMedicationConflictToMedications < ActiveRecord::Migration
  def change
    create_table :medication_conflict_to_medications do |t|
      t.integer :medication_conflict_id
      t.integer :medication_id
      t.integer :medication_id

      t.timestamps
    end
  end
end
