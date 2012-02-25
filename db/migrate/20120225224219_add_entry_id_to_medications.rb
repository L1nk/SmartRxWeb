class AddEntryIdToMedications < ActiveRecord::Migration
  def change
    add_column :medications, :entry_id, :integer

  end
end
