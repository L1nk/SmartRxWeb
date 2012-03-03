class ViewScheduleController < ApplicationController
  def index
    @schedule = Schedule.all(:conditions => ["user_id = ?", current_user.id])

    respond_to do |format|
      format.html # view_schedule.html.erb
      format.json { render json: @schedules }
    end
  end
end
