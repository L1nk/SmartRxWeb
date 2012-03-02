class Entry < ActiveRecord::Base
  #has_one :schedule_to_entry, :dependent => :destroy
  has_one :medication, :class_name => 'Medication', :foreign_key => 'type_id'
  has_one :event, :class_name => 'Event', :foreign_key => 'type_id'
  has_one :alert, :through => :medication
  has_one :alert, :through => :event
end
