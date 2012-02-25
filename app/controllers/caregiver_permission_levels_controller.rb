class CaregiverPermissionLevelsController < ApplicationController
  # GET /caregiver_permission_levels
  # GET /caregiver_permission_levels.json
  def index
    @caregiver_permission_levels = CaregiverPermissionLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @caregiver_permission_levels }
    end
  end

  # GET /caregiver_permission_levels/1
  # GET /caregiver_permission_levels/1.json
  def show
    @caregiver_permission_level = CaregiverPermissionLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @caregiver_permission_level }
    end
  end

  # GET /caregiver_permission_levels/new
  # GET /caregiver_permission_levels/new.json
  def new
    @caregiver_permission_level = CaregiverPermissionLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @caregiver_permission_level }
    end
  end

  # GET /caregiver_permission_levels/1/edit
  def edit
    @caregiver_permission_level = CaregiverPermissionLevel.find(params[:id])
  end

  # POST /caregiver_permission_levels
  # POST /caregiver_permission_levels.json
  def create
    @caregiver_permission_level = CaregiverPermissionLevel.new(params[:caregiver_permission_level])

    respond_to do |format|
      if @caregiver_permission_level.save
        format.html { redirect_to @caregiver_permission_level, notice: 'Caregiver permission level was successfully created.' }
        format.json { render json: @caregiver_permission_level, status: :created, location: @caregiver_permission_level }
      else
        format.html { render action: "new" }
        format.json { render json: @caregiver_permission_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /caregiver_permission_levels/1
  # PUT /caregiver_permission_levels/1.json
  def update
    @caregiver_permission_level = CaregiverPermissionLevel.find(params[:id])

    respond_to do |format|
      if @caregiver_permission_level.update_attributes(params[:caregiver_permission_level])
        format.html { redirect_to @caregiver_permission_level, notice: 'Caregiver permission level was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @caregiver_permission_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caregiver_permission_levels/1
  # DELETE /caregiver_permission_levels/1.json
  def destroy
    @caregiver_permission_level = CaregiverPermissionLevel.find(params[:id])
    @caregiver_permission_level.destroy

    respond_to do |format|
      format.html { redirect_to caregiver_permission_levels_url }
      format.json { head :no_content }
    end
  end
end
