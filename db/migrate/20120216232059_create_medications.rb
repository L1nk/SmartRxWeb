class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.integer :user_id
      t.integer :alert_id
      t.integer :time_block_id
      t.string :name
      t.string :importance
      t.float :quantity_per_dose
      t.float :number_of_doses
      t.boolean :is_critical
      t.string :directions
      t.text :comment

      t.timestamps
    end
  end
end
