class AddMedicationId1And2ToMedicationConflictToMedications < ActiveRecord::Migration
  def change
    add_column :medication_conflict_to_medications, :medication1_id, :integer
    add_column :medication_conflict_to_medications, :medication2_id, :integer
  end
end
