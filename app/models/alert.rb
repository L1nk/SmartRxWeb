class Alert < ActiveRecord::Base
  belongs_to :medication
  belongs_to :event
end
