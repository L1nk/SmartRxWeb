class Drug < ActiveRecord::Base
  has_many :schedule_drugs
end
