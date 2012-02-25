class TimeConflictsController < ApplicationController
  # GET /time_conflicts
  # GET /time_conflicts.json
  def index
    @time_conflicts = TimeConflict.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @time_conflicts }
    end
  end

  # GET /time_conflicts/1
  # GET /time_conflicts/1.json
  def show
    @time_conflict = TimeConflict.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @time_conflict }
    end
  end

  # GET /time_conflicts/new
  # GET /time_conflicts/new.json
  def new
    @time_conflict = TimeConflict.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @time_conflict }
    end
  end

  # GET /time_conflicts/1/edit
  def edit
    @time_conflict = TimeConflict.find(params[:id])
  end

  # POST /time_conflicts
  # POST /time_conflicts.json
  def create
    @time_conflict = TimeConflict.new(params[:time_conflict])

    respond_to do |format|
      if @time_conflict.save
        format.html { redirect_to @time_conflict, notice: 'Time conflict was successfully created.' }
        format.json { render json: @time_conflict, status: :created, location: @time_conflict }
      else
        format.html { render action: "new" }
        format.json { render json: @time_conflict.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /time_conflicts/1
  # PUT /time_conflicts/1.json
  def update
    @time_conflict = TimeConflict.find(params[:id])

    respond_to do |format|
      if @time_conflict.update_attributes(params[:time_conflict])
        format.html { redirect_to @time_conflict, notice: 'Time conflict was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @time_conflict.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_conflicts/1
  # DELETE /time_conflicts/1.json
  def destroy
    @time_conflict = TimeConflict.find(params[:id])
    @time_conflict.destroy

    respond_to do |format|
      format.html { redirect_to time_conflicts_url }
      format.json { head :no_content }
    end
  end
end
