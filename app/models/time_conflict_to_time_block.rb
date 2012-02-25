class TimeConflictToTimeBlock < ActiveRecord::Base
  belongs_to :time_conflict
  belongs_to :time_block1, :class_name => 'TimeBlock'
  belongs_to :time_block2, :class_name => 'TimeBlock'
end
