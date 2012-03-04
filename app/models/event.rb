class Event < ActiveRecord::Base
  has_one :alert, :dependent => :destroy
  belongs_to :entry, :dependent => :destroy
  belongs_to :user
end
