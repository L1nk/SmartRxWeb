class HomeController < ApplicationController
  
  def index
    
    get_schedule_info(current_user)

    if session[:managing_patient]
      session[:managing_patient] = false
      session[:patient_id] = -1
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @all_entries }
    end
  end

  #helper functions
  def get_schedule_info(user)
    schedule = Schedule.all(:conditions => ["user_id = ?", user.id])
    @schedule = schedule[0]
    
    event_entries = Entry.all(:conditions => ["schedule_id = ?", @schedule.id], :joins => :event, :include => :event)
    schedule_drug_entries = Entry.all(:conditions => ["schedule_id = ?", @schedule.id], :joins => :schedule_drug, :include => :schedule_drug)
    
    @date = params[:month] ? Date.strptime(params[:month], '%Y-%m') : Date.today

    count = 0
    @all_entries = []

    for event in event_entries
      @all_entries[count] = event
      count += 1
    end

    for schedule_drug in schedule_drug_entries
      @all_entries[count] = schedule_drug
      count += 1
    end
  end

end
