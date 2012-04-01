class DropMedications < ActiveRecord::Migration
  def up
    drop_table :medications
  end

  def down
  end
end
