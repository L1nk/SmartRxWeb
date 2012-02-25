class ScheduleToAlert < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :schedule_alert
end
