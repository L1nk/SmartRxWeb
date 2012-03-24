class SessionsController < Devise::SessionsController
  def create
    super
    
    #set notifications
    requests = CaregiverRequest.all(:conditions => ["patient_email = ?", current_user.email])
    
    if requests[0]
      session[:has_notifications] = true
    else
      session[:has_notifications] = false
    end

  end
end
