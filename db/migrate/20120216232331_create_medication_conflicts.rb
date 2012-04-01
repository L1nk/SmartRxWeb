class CreateMedicationConflicts < ActiveRecord::Migration
  def change
    create_table :medication_conflicts do |t|
      t.integer :medication1_id
      t.integer :medication2_id
      t.integer :conflict_type

      t.timestamps
    end
  end
end
