class Medication < ActiveRecord::Base
  belongs_to :user
  has_one :alert, :dependent => :destroy
  belongs_to :entry, :dependent => :destroy

  validates :name, :quantity_per_dose, :number_of_doses, :directions, :presence => true
end
