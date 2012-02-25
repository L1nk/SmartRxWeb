class AddEntryIdToTimeBlocks < ActiveRecord::Migration
  def change
    add_column :time_blocks, :entry_id, :integer

  end
end
