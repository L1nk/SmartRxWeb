class CreateDrugTimeConflicts < ActiveRecord::Migration
  def change
    create_table :drug_time_conflicts do |t|
      t.integer :drug1_id
      t.integer :drug2_id
      t.integer :conflict_time

      t.timestamps
    end
  end
end
