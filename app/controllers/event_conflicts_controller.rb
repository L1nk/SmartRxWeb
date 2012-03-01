class EventConflictsController < ApplicationController
  # GET /event_conflicts
  # GET /event_conflicts.json
  def index
    @event_conflicts = EventConflict.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_conflicts }
    end
  end

  # GET /event_conflicts/1
  # GET /event_conflicts/1.json
  def show
    @event_conflict = EventConflict.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_conflict }
    end
  end

  # GET /event_conflicts/new
  # GET /event_conflicts/new.json
  def new
    @event_conflict = EventConflict.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_conflict }
    end
  end

  # GET /event_conflicts/1/edit
  def edit
    @event_conflict = EventConflict.find(params[:id])
  end

  # POST /event_conflicts
  # POST /event_conflicts.json
  def create
    @event_conflict = EventConflict.new(params[:event_conflict])

    respond_to do |format|
      if @event_conflict.save
        format.html { redirect_to @event_conflict, notice: 'Event conflict was successfully created.' }
        format.json { render json: @event_conflict, status: :created, location: @event_conflict }
      else
        format.html { render action: "new" }
        format.json { render json: @event_conflict.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_conflicts/1
  # PUT /event_conflicts/1.json
  def update
    @event_conflict = EventConflict.find(params[:id])

    respond_to do |format|
      if @event_conflict.update_attributes(params[:event_conflict])
        format.html { redirect_to @event_conflict, notice: 'Event conflict was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_conflict.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_conflicts/1
  # DELETE /event_conflicts/1.json
  def destroy
    @event_conflict = EventConflict.find(params[:id])
    @event_conflict.destroy

    respond_to do |format|
      format.html { redirect_to event_conflicts_url }
      format.json { head :no_content }
    end
  end
end
