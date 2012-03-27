class ManageCaregiverController < ApplicationController
  def index
  end

  def patients
    get_patients()
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @all_entries }
    end
  end

  def patient_schedule
    user = User.find(params[:id])
    
    get_schedule_info(user)

    session[:managing_patient] = true
    session[:patient_id] = user.id
    session[:patient_schedule_id] = user.schedule_id

    respond_to do |format|
      format.html # patient_schedule.html.erb
      format.json { render json: @all_entries }
    end
  end

  def get_patients()
    @patients = User.all(:conditions => ["caregiver_id = ?", current_user.id])
  end

  def get_schedule_info(user)
    schedule = Schedule.all(:conditions => ["user_id = ?", user.id])
    @schedule = schedule[0]
    
    event_entries = Entry.all(:conditions => ["schedule_id = ?", @schedule.id], :joins => :event, :include => :event)
    medication_entries = Entry.all(:conditions => ["schedule_id = ?", @schedule.id], :joins => :medication, :include => :medication)
    
    @date = params[:month] ? Date.strptime(params[:month], '%Y-%m') : Date.today

    count = 0
    @all_entries = []

    for event in event_entries
      @all_entries[count] = event
      count += 1
    end

    for medication in medication_entries
      @all_entries[count] = medication
      count += 1
    end
  end
end
