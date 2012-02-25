class Schedule < ActiveRecord::Base
  has_many :schedule_to_entries, :dependent => :destroy
  has_many :users
end
