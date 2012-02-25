class CaregiverPermissionLevel < ActiveRecord::Base
  belongs_to :caregiver, :class_name => 'User'
end
