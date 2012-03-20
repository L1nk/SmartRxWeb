class HomeController < ApplicationController
  def index
    schedule = Schedule.all(:conditions => ["user_id = ?", current_user.id])
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
    
    respond_to do |format|
      format.html # home.html.erb
      format.json { render json: @event_entries }
    end
  end
end
