class ScheduleDrugsConflictsController < ApplicationController
  # GET /schedule_drugs_conflicts
  # GET /schedule_drugs_conflicts.json
  def index
    @schedule_drugs_conflicts = ScheduleDrugsConflict.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedule_drugs_conflicts }
    end
  end

  # GET /schedule_drugs_conflicts/1
  # GET /schedule_drugs_conflicts/1.json
  def show
    @schedule_drugs_conflict = ScheduleDrugsConflict.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule_drugs_conflict }
    end
  end

  # GET /schedule_drugs_conflicts/new
  # GET /schedule_drugs_conflicts/new.json
  def new
    @schedule_drugs_conflict = ScheduleDrugsConflict.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule_drugs_conflict }
    end
  end

  # GET /schedule_drugs_conflicts/1/edit
  def edit
    @schedule_drugs_conflict = ScheduleDrugsConflict.find(params[:id])
  end

  # POST /schedule_drugs_conflicts
  # POST /schedule_drugs_conflicts.json
  def create
    @schedule_drugs_conflict = ScheduleDrugsConflict.new(params[:schedule_drugs_conflict])

    respond_to do |format|
      if @schedule_drugs_conflict.save
        format.html { redirect_to @schedule_drugs_conflict, notice: 'Schedule drugs conflict was successfully created.' }
        format.json { render json: @schedule_drugs_conflict, status: :created, location: @schedule_drugs_conflict }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule_drugs_conflict.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedule_drugs_conflicts/1
  # PUT /schedule_drugs_conflicts/1.json
  def update
    @schedule_drugs_conflict = ScheduleDrugsConflict.find(params[:id])

    respond_to do |format|
      if @schedule_drugs_conflict.update_attributes(params[:schedule_drugs_conflict])
        format.html { redirect_to @schedule_drugs_conflict, notice: 'Schedule drugs conflict was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule_drugs_conflict.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_drugs_conflicts/1
  # DELETE /schedule_drugs_conflicts/1.json
  def destroy
    @schedule_drugs_conflict = ScheduleDrugsConflict.find(params[:id])
    @schedule_drugs_conflict.destroy

    respond_to do |format|
      format.html { redirect_to schedule_drugs_conflicts_url }
      format.json { head :no_content }
    end
  end

  def unresolved
    
    schedule_drugs_conflicts = ScheduleDrugsConflict.all(:conditions => ["user_id = ?", current_user.id])

    @conflicts = []
    index = 0
    for conflict in schedule_drugs_conflicts
      schedule_drug1 = ScheduleDrug.find(conflict.schedule_drug1_id)
      schedule_drug2 = ScheduleDrug.find(conflict.schedule_drug2_id)
      @conflicts[index] = [schedule_drug1, schedule_drug2]
      index += 1
    end
    
    respond_to do |format|
      format.html # unresolved.html.erb
      format.json { render json: @conflicts }
    end
  end
end
