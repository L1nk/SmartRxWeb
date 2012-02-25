class MedicationConflictToMedication < ActiveRecord::Base
  belongs_to :medication_conflict
  belongs_to :medication1, :class_name => 'Medication'
  belongs_to :medication2, :class_name => 'Medication'
end
