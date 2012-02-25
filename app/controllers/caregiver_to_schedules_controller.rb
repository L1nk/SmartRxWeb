class CaregiverToSchedulesController < ApplicationController
  # GET /caregiver_to_schedules
  # GET /caregiver_to_schedules.json
  def index
    @caregiver_to_schedules = CaregiverToSchedule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @caregiver_to_schedules }
    end
  end

  # GET /caregiver_to_schedules/1
  # GET /caregiver_to_schedules/1.json
  def show
    @caregiver_to_schedule = CaregiverToSchedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @caregiver_to_schedule }
    end
  end

  # GET /caregiver_to_schedules/new
  # GET /caregiver_to_schedules/new.json
  def new
    @caregiver_to_schedule = CaregiverToSchedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @caregiver_to_schedule }
    end
  end

  # GET /caregiver_to_schedules/1/edit
  def edit
    @caregiver_to_schedule = CaregiverToSchedule.find(params[:id])
  end

  # POST /caregiver_to_schedules
  # POST /caregiver_to_schedules.json
  def create
    @caregiver_to_schedule = CaregiverToSchedule.new(params[:caregiver_to_schedule])

    respond_to do |format|
      if @caregiver_to_schedule.save
        format.html { redirect_to @caregiver_to_schedule, notice: 'Caregiver to schedule was successfully created.' }
        format.json { render json: @caregiver_to_schedule, status: :created, location: @caregiver_to_schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @caregiver_to_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /caregiver_to_schedules/1
  # PUT /caregiver_to_schedules/1.json
  def update
    @caregiver_to_schedule = CaregiverToSchedule.find(params[:id])

    respond_to do |format|
      if @caregiver_to_schedule.update_attributes(params[:caregiver_to_schedule])
        format.html { redirect_to @caregiver_to_schedule, notice: 'Caregiver to schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @caregiver_to_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caregiver_to_schedules/1
  # DELETE /caregiver_to_schedules/1.json
  def destroy
    @caregiver_to_schedule = CaregiverToSchedule.find(params[:id])
    @caregiver_to_schedule.destroy

    respond_to do |format|
      format.html { redirect_to caregiver_to_schedules_url }
      format.json { head :no_content }
    end
  end
end
