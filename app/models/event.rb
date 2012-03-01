class Event < ActiveRecord::Base
  has_one :alert
  belongs_to :entry
end
