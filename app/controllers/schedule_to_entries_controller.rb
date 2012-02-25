class ScheduleToEntriesController < ApplicationController
  # GET /schedule_to_entries
  # GET /schedule_to_entries.json
  def index
    @schedule_to_entries = ScheduleToEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedule_to_entries }
    end
  end

  # GET /schedule_to_entries/1
  # GET /schedule_to_entries/1.json
  def show
    @schedule_to_entry = ScheduleToEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule_to_entry }
    end
  end

  # GET /schedule_to_entries/new
  # GET /schedule_to_entries/new.json
  def new
    @schedule_to_entry = ScheduleToEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule_to_entry }
    end
  end

  # GET /schedule_to_entries/1/edit
  def edit
    @schedule_to_entry = ScheduleToEntry.find(params[:id])
  end

  # POST /schedule_to_entries
  # POST /schedule_to_entries.json
  def create
    @schedule_to_entry = ScheduleToEntry.new(params[:schedule_to_entry])

    respond_to do |format|
      if @schedule_to_entry.save
        format.html { redirect_to @schedule_to_entry, notice: 'Schedule to entry was successfully created.' }
        format.json { render json: @schedule_to_entry, status: :created, location: @schedule_to_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule_to_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedule_to_entries/1
  # PUT /schedule_to_entries/1.json
  def update
    @schedule_to_entry = ScheduleToEntry.find(params[:id])

    respond_to do |format|
      if @schedule_to_entry.update_attributes(params[:schedule_to_entry])
        format.html { redirect_to @schedule_to_entry, notice: 'Schedule to entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule_to_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_to_entries/1
  # DELETE /schedule_to_entries/1.json
  def destroy
    @schedule_to_entry = ScheduleToEntry.find(params[:id])
    @schedule_to_entry.destroy

    respond_to do |format|
      format.html { redirect_to schedule_to_entries_url }
      format.json { head :no_content }
    end
  end
end
