class MedicationConflictsController < ApplicationController
  # GET /medication_conflicts
  # GET /medication_conflicts.json
  def index
    @medication_conflicts = MedicationConflict.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medication_conflicts }
    end
  end

  # GET /medication_conflicts/1
  # GET /medication_conflicts/1.json
  def show
    @medication_conflict = MedicationConflict.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medication_conflict }
    end
  end

  # GET /medication_conflicts/new
  # GET /medication_conflicts/new.json
  def new
    @medication_conflict = MedicationConflict.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medication_conflict }
    end
  end

  # GET /medication_conflicts/1/edit
  def edit
    @medication_conflict = MedicationConflict.find(params[:id])
  end

  # POST /medication_conflicts
  # POST /medication_conflicts.json
  def create
    @medication_conflict = MedicationConflict.new(params[:medication_conflict])

    respond_to do |format|
      if @medication_conflict.save
        format.html { redirect_to @medication_conflict, notice: 'Medication conflict was successfully created.' }
        format.json { render json: @medication_conflict, status: :created, location: @medication_conflict }
      else
        format.html { render action: "new" }
        format.json { render json: @medication_conflict.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medication_conflicts/1
  # PUT /medication_conflicts/1.json
  def update
    @medication_conflict = MedicationConflict.find(params[:id])

    respond_to do |format|
      if @medication_conflict.update_attributes(params[:medication_conflict])
        format.html { redirect_to @medication_conflict, notice: 'Medication conflict was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medication_conflict.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medication_conflicts/1
  # DELETE /medication_conflicts/1.json
  def destroy
    @medication_conflict = MedicationConflict.find(params[:id])
    @medication_conflict.destroy

    respond_to do |format|
      format.html { redirect_to medication_conflicts_url }
      format.json { head :no_content }
    end
  end
end
