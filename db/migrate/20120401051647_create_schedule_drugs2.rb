class CreateScheduleDrugs2 < ActiveRecord::Migration
  def up
    create_table :schedule_drugs do |t|
      t.integer :user_id
      t.integer :alert_id
      t.integer :entry_id
      t.text :comments
      t.integer :drug_id
      t.string :quantity_per_dose
      t.string :number_of_doses
      t.boolean :has_conflict, :default => false
      
      t.timestamps
    end
  end

  def down
    drop_table :schedule_drugs
  end
end
