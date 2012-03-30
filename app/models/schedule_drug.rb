class ScheduleDrug < ActiveRecord::Base
  belongs_to :user
  has_one :alert, :dependent => :destroy
  belongs_to :entry, :dependent => :destroy
  belongs_to :drug

  validates :quantity_per_dose, :number_of_doses, :presence => true
end
