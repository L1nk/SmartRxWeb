class RemoveTimeBlockIdFromMedications < ActiveRecord::Migration
  def up
    remove_column :medications, :time_block_id
      end

  def down
    add_column :medications, :time_block_id, :integer
  end
end
