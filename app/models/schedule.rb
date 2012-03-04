class Schedule < ActiveRecord::Base
  #has_many :schedule_to_entries, :dependent => :destroy
  belongs_to :user
  has_many :caregiver_to_schedules, :dependent => :destroy
  has_many :medication_conflicts
end
