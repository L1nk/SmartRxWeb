class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.integer :caregiver_id
      t.string :fname
      t.string :lname
      t.string :phone_number
      t.boolean :is_caregiver
      t.boolean :has_caregiver

      t.timestamps
    end
  end
end
