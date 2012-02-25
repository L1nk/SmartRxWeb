class ScheduleAlert < ActiveRecord::Base
  belongs_to :medication
  belongs_to :entry
end
