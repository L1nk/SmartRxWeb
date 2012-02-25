class CreateTimeConflictToTimeBlocks < ActiveRecord::Migration
  def change
    create_table :time_conflict_to_time_blocks do |t|
      t.integer :time_conflict_id
      t.integer :time_block1_id
      t.integer :time_block2_id

      t.timestamps
    end
  end
end
