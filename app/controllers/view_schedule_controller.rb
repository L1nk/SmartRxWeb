class ViewScheduleController < ApplicationController
  def index
    schedule = Schedule.all(:conditions => ["user_id = ?", current_user.id])
    @schedule = schedule[0]
    
    @event_entries = Entry.all(:conditions => ["schedule_id = ?", @schedule.id], :joins => :event, :include => :event)
    @medication_entries = Entry.all(:conditions => ["schedule_id = ?", @schedule.id], :joins => :medication, :include => :medication)

    respond_to do |format|
      format.html # view_schedule.html.erb
      format.json { render json: @schedule }
    end
  end
end
