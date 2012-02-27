# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120226002207) do

  create_table "caregiver_permission_levels", :force => true do |t|
    t.integer  "caregiver_id"
    t.integer  "user_id"
    t.boolean  "can_edit_alerts"
    t.boolean  "can_edit_schedule"
    t.boolean  "can_edit_time_conflicts"
    t.boolean  "can_edit_medication_conflicts"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "caregiver_to_schedules", :force => true do |t|
    t.integer  "schedule_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "entries", :force => true do |t|
    t.integer  "medication_id"
    t.integer  "time_block_id"
    t.datetime "date"
    t.boolean  "is_taken"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "medication_conflict_to_medications", :force => true do |t|
    t.integer  "medication_conflict_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "medication1_id"
    t.integer  "medication2_id"
  end

  create_table "medication_conflicts", :force => true do |t|
    t.integer  "schedule_id"
    t.boolean  "is_dismissed"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "medications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "alert_id"
    t.string   "name"
    t.string   "importance"
    t.float    "quantity_per_dose"
    t.float    "number_of_doses"
    t.boolean  "is_critical"
    t.string   "directions"
    t.text     "comment"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "entry_id"
  end

  create_table "schedule_alerts", :force => true do |t|
    t.integer  "medication_id"
    t.datetime "alert_delta_time"
    t.string   "alert_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "entry_id"
  end

  create_table "schedule_to_alerts", :force => true do |t|
    t.integer  "schedule_id"
    t.integer  "alert_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "schedule_to_entries", :force => true do |t|
    t.integer  "schedule_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "entry_id"
  end

  create_table "schedules", :force => true do |t|
    t.integer  "user_id"
    t.string   "schedule_name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "time_blocks", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "frequency"
    t.string   "days_for_frequency"
    t.date     "date"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "entry_id"
  end

  create_table "time_conflict_to_time_blocks", :force => true do |t|
    t.integer  "time_conflict_id"
    t.integer  "time_block1_id"
    t.integer  "time_block2_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "time_conflicts", :force => true do |t|
    t.integer  "schedule_id"
    t.boolean  "is_dismissed"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "user_infos", :force => true do |t|
    t.integer  "user_id"
    t.integer  "caregiver_id"
    t.string   "fname"
    t.string   "lname"
    t.string   "phone_number"
    t.boolean  "is_caregiver"
    t.boolean  "has_caregiver"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "caregiver_id"
    t.string   "fname"
    t.string   "lname"
    t.string   "phone"
    t.boolean  "is_caregiver"
    t.boolean  "has_caregiver"
    t.integer  "schedule_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
