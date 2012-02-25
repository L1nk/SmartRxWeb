class CaregiverToSchedule < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :user
end
