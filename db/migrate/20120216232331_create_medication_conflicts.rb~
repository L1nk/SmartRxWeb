class CreateMedicationConflicts < ActiveRecord::Migration
  def change
    create_table :medication_conflicts do |t|
      t.integer :schedule_id
      t.boolean :is_dismissed

      t.timestamps
    end
  end
end
