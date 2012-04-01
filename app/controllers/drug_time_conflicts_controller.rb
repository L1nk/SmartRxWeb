class DrugTimeConflictsController < ApplicationController
  # GET /drug_time_conflicts
  # GET /drug_time_conflicts.json
  def index
    @drug_time_conflicts = DrugTimeConflict.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drug_time_conflicts }
    end
  end

  # GET /drug_time_conflicts/1
  # GET /drug_time_conflicts/1.json
  def show
    @drug_time_conflict = DrugTimeConflict.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @drug_time_conflict }
    end
  end

  # GET /drug_time_conflicts/new
  # GET /drug_time_conflicts/new.json
  def new
    @drug_time_conflict = DrugTimeConflict.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @drug_time_conflict }
    end
  end

  # GET /drug_time_conflicts/1/edit
  def edit
    @drug_time_conflict = DrugTimeConflict.find(params[:id])
  end

  # POST /drug_time_conflicts
  # POST /drug_time_conflicts.json
  def create
    @drug_time_conflict = DrugTimeConflict.new(params[:drug_time_conflict])

    respond_to do |format|
      if @drug_time_conflict.save
        format.html { redirect_to @drug_time_conflict, notice: 'Drug time conflict was successfully created.' }
        format.json { render json: @drug_time_conflict, status: :created, location: @drug_time_conflict }
      else
        format.html { render action: "new" }
        format.json { render json: @drug_time_conflict.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /drug_time_conflicts/1
  # PUT /drug_time_conflicts/1.json
  def update
    @drug_time_conflict = DrugTimeConflict.find(params[:id])

    respond_to do |format|
      if @drug_time_conflict.update_attributes(params[:drug_time_conflict])
        format.html { redirect_to @drug_time_conflict, notice: 'Drug time conflict was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @drug_time_conflict.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drug_time_conflicts/1
  # DELETE /drug_time_conflicts/1.json
  def destroy
    @drug_time_conflict = DrugTimeConflict.find(params[:id])
    @drug_time_conflict.destroy

    respond_to do |format|
      format.html { redirect_to drug_time_conflicts_url }
      format.json { head :no_content }
    end
  end
end
