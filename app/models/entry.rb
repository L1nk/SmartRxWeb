class Entry < ActiveRecord::Base
  #has_one :schedule_to_entry, :dependent => :destroy
  has_one :medication, :dependent => :destroy
  has_one :event, :dependent => :destroy
  has_one :alert, :through => :medication
  has_one :alert, :through => :event
end
