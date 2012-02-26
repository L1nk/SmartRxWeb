class AddUserInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :caregiver_id, :integer
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :phone, :string
    add_column :users, :is_caregiver, :boolean
    add_column :users, :has_caregiver, :boolean
    add_column :users, :schedule_id, :integer
  end
end
