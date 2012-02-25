class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :medication_id
      t.integer :time_block_id
      t.datetime :date
      t.boolean :is_taken

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
