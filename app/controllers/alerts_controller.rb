class ScheduleAlertsController < ApplicationController
  # GET /schedule_alerts
  # GET /schedule_alerts.json
  def index
    @schedule_alerts = ScheduleAlert.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedule_alerts }
    end
  end

  # GET /schedule_alerts/1
  # GET /schedule_alerts/1.json
  def show
    @schedule_alert = ScheduleAlert.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule_alert }
    end
  end

  # GET /schedule_alerts/new
  # GET /schedule_alerts/new.json
  def new
    @schedule_alert = ScheduleAlert.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule_alert }
    end
  end

  # GET /schedule_alerts/1/edit
  def edit
    @schedule_alert = ScheduleAlert.find(params[:id])
  end

  # POST /schedule_alerts
  # POST /schedule_alerts.json
  def create
    @schedule_alert = ScheduleAlert.new(params[:schedule_alert])

    respond_to do |format|
      if @schedule_alert.save
        format.html { redirect_to @schedule_alert, notice: 'Schedule alert was successfully created.' }
        format.json { render json: @schedule_alert, status: :created, location: @schedule_alert }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedule_alerts/1
  # PUT /schedule_alerts/1.json
  def update
    @schedule_alert = ScheduleAlert.find(params[:id])

    respond_to do |format|
      if @schedule_alert.update_attributes(params[:schedule_alert])
        format.html { redirect_to @schedule_alert, notice: 'Schedule alert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_alerts/1
  # DELETE /schedule_alerts/1.json
  def destroy
    @schedule_alert = ScheduleAlert.find(params[:id])
    @schedule_alert.destroy

    respond_to do |format|
      format.html { redirect_to schedule_alerts_url }
      format.json { head :no_content }
    end
  end
end
