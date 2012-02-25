class ScheduleToEntry < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :entry
end
