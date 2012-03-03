class User < ActiveRecord::Base
  has_one :schedule
  has_one :caregiver, :class_name => 'User'
  has_many :caregiver_permission_levels
  has_many :caregiver_to_schedules
  has_many :medications
  has_many :events

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
