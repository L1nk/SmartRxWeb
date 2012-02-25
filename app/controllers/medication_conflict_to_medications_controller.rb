class MedicationConflictToMedicationsController < ApplicationController
  # GET /medication_conflict_to_medications
  # GET /medication_conflict_to_medications.json
  def index
    @medication_conflict_to_medications = MedicationConflictToMedication.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medication_conflict_to_medications }
    end
  end

  # GET /medication_conflict_to_medications/1
  # GET /medication_conflict_to_medications/1.json
  def show
    @medication_conflict_to_medication = MedicationConflictToMedication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medication_conflict_to_medication }
    end
  end

  # GET /medication_conflict_to_medications/new
  # GET /medication_conflict_to_medications/new.json
  def new
    @medication_conflict_to_medication = MedicationConflictToMedication.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medication_conflict_to_medication }
    end
  end

  # GET /medication_conflict_to_medications/1/edit
  def edit
    @medication_conflict_to_medication = MedicationConflictToMedication.find(params[:id])
  end

  # POST /medication_conflict_to_medications
  # POST /medication_conflict_to_medications.json
  def create
    @medication_conflict_to_medication = MedicationConflictToMedication.new(params[:medication_conflict_to_medication])

    respond_to do |format|
      if @medication_conflict_to_medication.save
        format.html { redirect_to @medication_conflict_to_medication, notice: 'Medication conflict to medication was successfully created.' }
        format.json { render json: @medication_conflict_to_medication, status: :created, location: @medication_conflict_to_medication }
      else
        format.html { render action: "new" }
        format.json { render json: @medication_conflict_to_medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medication_conflict_to_medications/1
  # PUT /medication_conflict_to_medications/1.json
  def update
    @medication_conflict_to_medication = MedicationConflictToMedication.find(params[:id])

    respond_to do |format|
      if @medication_conflict_to_medication.update_attributes(params[:medication_conflict_to_medication])
        format.html { redirect_to @medication_conflict_to_medication, notice: 'Medication conflict to medication was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medication_conflict_to_medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medication_conflict_to_medications/1
  # DELETE /medication_conflict_to_medications/1.json
  def destroy
    @medication_conflict_to_medication = MedicationConflictToMedication.find(params[:id])
    @medication_conflict_to_medication.destroy

    respond_to do |format|
      format.html { redirect_to medication_conflict_to_medications_url }
      format.json { head :no_content }
    end
  end
end
