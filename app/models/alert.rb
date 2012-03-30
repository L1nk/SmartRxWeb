class Alert < ActiveRecord::Base
  belongs_to :schedule_drug
  belongs_to :event
end
