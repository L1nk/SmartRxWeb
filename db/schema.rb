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

ActiveRecord::Schema.define(:version => 20120401080505) do

  create_table "alerts", :force => true do |t|
    t.integer  "event_id"
    t.integer  "schedule_drug_id"
    t.string   "name"
    t.string   "alert_type"
    t.integer  "user_id"
    t.boolean  "is_dismissed"
    t.datetime "alert_time"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

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

  create_table "caregiver_requests", :force => true do |t|
    t.integer  "caregiver_id"
    t.string   "patient_email"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "caregiver_to_schedules", :force => true do |t|
    t.integer  "schedule_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "drug_time_conflicts", :force => true do |t|
    t.integer  "drug1_id"
    t.integer  "drug2_id"
    t.integer  "conflict_time"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "drugs", :force => true do |t|
    t.string   "name"
    t.text     "directions"
    t.boolean  "with_meal"
    t.integer  "importance"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "entries", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "event_id"
    t.integer  "schedule_drug_id"
    t.integer  "schedule_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "event_conflicts", :force => true do |t|
    t.integer  "entry1_id"
    t.integer  "entry2_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.integer  "entry_id"
    t.string   "name"
    t.text     "description"
    t.integer  "alert_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "medication_conflicts", :force => true do |t|
    t.integer  "medication1_id"
    t.integer  "medication2_id"
    t.integer  "conflict_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "schedule_drugs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "alert_id"
    t.integer  "entry_id"
    t.text     "comments"
    t.integer  "drug_id"
    t.string   "quantity_per_dose"
    t.string   "number_of_doses"
    t.boolean  "has_conflict",      :default => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "schedule_drugs_conflicts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "schedule_drug1_id"
    t.integer  "schedule_drug2_id"
    t.string   "reason"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "schedules", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                      :default => "",    :null => false
    t.string   "encrypted_password",         :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "caregiver_id"
    t.string   "fname"
    t.string   "lname"
    t.string   "phone_number"
    t.string   "is_caregiver"
    t.string   "has_caregiver"
    t.integer  "schedule_id"
    t.boolean  "has_schedule_drug_conflict", :default => false
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
