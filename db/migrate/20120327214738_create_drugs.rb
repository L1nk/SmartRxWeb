class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :name      
      t.text :directions
      t.boolean :with_meal
      t.integer :importance

      t.timestamps
    end
  end
end
