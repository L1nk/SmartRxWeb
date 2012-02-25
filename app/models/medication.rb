class Medication < ActiveRecord::Base
  belongs_to :user
  has_many :schedule_alerts
  has_many :time_blocks
end
