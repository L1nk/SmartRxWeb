class Medication < ActiveRecord::Base
  belongs_to :user
  has_many :schedule_alerts
  belongs_to :entry
end
