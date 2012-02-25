class Entry < ActiveRecord::Base
  has_many :schedule_to_entries, :dependent => :destroy
  has_one :medication
  has_one :time_block
end
