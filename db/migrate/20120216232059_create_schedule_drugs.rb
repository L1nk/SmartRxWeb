class CreateScheduleDrugs < ActiveRecord::Migration
  def change
    create_table :schedule_drugs do |t|
      t.integer :user_id
      t.integer :alert_id
      t.integer :entry_id
      t.text :comments
      t.integer :drug_id
      t.string :quantity_per_dose
      t.string :number_of_doses
      
      t.timestamps
    end
  end
end
