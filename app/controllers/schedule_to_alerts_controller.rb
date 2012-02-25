class ScheduleToAlertsController < ApplicationController
  # GET /schedule_to_alerts
  # GET /schedule_to_alerts.json
  def index
    @schedule_to_alerts = ScheduleToAlert.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedule_to_alerts }
    end
  end

  # GET /schedule_to_alerts/1
  # GET /schedule_to_alerts/1.json
  def show
    @schedule_to_alert = ScheduleToAlert.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule_to_alert }
    end
  end

  # GET /schedule_to_alerts/new
  # GET /schedule_to_alerts/new.json
  def new
    @schedule_to_alert = ScheduleToAlert.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule_to_alert }
    end
  end

  # GET /schedule_to_alerts/1/edit
  def edit
    @schedule_to_alert = ScheduleToAlert.find(params[:id])
  end

  # POST /schedule_to_alerts
  # POST /schedule_to_alerts.json
  def create
    @schedule_to_alert = ScheduleToAlert.new(params[:schedule_to_alert])

    respond_to do |format|
      if @schedule_to_alert.save
        format.html { redirect_to @schedule_to_alert, notice: 'Schedule to alert was successfully created.' }
        format.json { render json: @schedule_to_alert, status: :created, location: @schedule_to_alert }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule_to_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedule_to_alerts/1
  # PUT /schedule_to_alerts/1.json
  def update
    @schedule_to_alert = ScheduleToAlert.find(params[:id])

    respond_to do |format|
      if @schedule_to_alert.update_attributes(params[:schedule_to_alert])
        format.html { redirect_to @schedule_to_alert, notice: 'Schedule to alert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule_to_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_to_alerts/1
  # DELETE /schedule_to_alerts/1.json
  def destroy
    @schedule_to_alert = ScheduleToAlert.find(params[:id])
    @schedule_to_alert.destroy

    respond_to do |format|
      format.html { redirect_to schedule_to_alerts_url }
      format.json { head :no_content }
    end
  end
end
