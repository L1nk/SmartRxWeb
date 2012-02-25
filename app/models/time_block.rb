class TimeBlock < ActiveRecord::Base
  has_many :time_conflict_to_time_blocks
  belongs_to :entry
end
