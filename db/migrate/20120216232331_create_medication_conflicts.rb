class CreateMedicationConflicts < ActiveRecord::Migration
  def change
    create_table :medication_conflicts do |t|
      t.integer :medication1_id
      t.boolean :medication2_id

      t.timestamps
    end
  end
end
