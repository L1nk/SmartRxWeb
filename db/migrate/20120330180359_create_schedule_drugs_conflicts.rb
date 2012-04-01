class CreateScheduleDrugsConflicts < ActiveRecord::Migration
  def change
    create_table :schedule_drugs_conflicts do |t|
      t.integer :user_id
      t.integer :schedule_drug1_id
      t.integer :schedule_drug2_id
      t.string :reason

      t.timestamps
    end
  end
end
