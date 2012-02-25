class AddEntryIdToScheduleToEntries < ActiveRecord::Migration
  def change
    add_column :schedule_to_entries, :entry_id, :integer

  end
end
