class Medication < ActiveRecord::Base
  belongs_to :user
  has_one :alert
  belongs_to :entry
end
