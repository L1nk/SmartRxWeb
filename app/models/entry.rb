class Entry < ActiveRecord::Base
  has_many :schedule_to_entries, :dependent => :destroy
  belongs_to :medications
  has_one :time_block
end
