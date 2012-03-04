class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    entries = Entry.all(:conditions => ["event_id = ?", @event.id])
    @entry = entries[0]
    
    #checks to see if this medication has an alert to check the has_alert checkbox
    alerts = Alert.all(:conditions => ["event_id = ?", @event.id])
    @alert_first = alerts[0]
    
    if @alert_first
      @has_alert = true
    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_event_entry
    
    @event = Event.new(params[:event])
    @event.user = current_user
    @entry = @event.build_entry(params[:entry])
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to manage_entries_path, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
        
        @entry.event_id = @event.id
        @entry.schedule_id = session[:schedule_id]
        has_alert = params[:has_alert]
        
        if @entry.save
          if has_alert
            @alert = @event.create_alert(params[:alert])
            @event.alert_id = @alert.id
            @event.save
          end
        end
        
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  #def update
  #  @event = Event.find(params[:id])
  #
  #  respond_to do |format|
  #    if @event.update_attributes(params[:event])
  #      format.html { redirect_to @event, notice: 'Event was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @event.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  def update
    @event = Event.find(params[:id])
    entries = Entry.all(:conditions => ["event_id = ?", @event.id])
    @entry = entries[0]

    alert_checked = params[:has_alert]
    alerts = Alert.all(:conditions => ["event_id = ?", @event.id])
    alert_exists = alerts[0]
    
    if alert_checked
      if !alert_exists
        alert = @event.create_alert
        @event.alert_id = alert.id
        @event.save
      end
    else  
      if alert_exists
        @event.alert_id = nil
        @event.save
        Alert.delete(alert_exists.id)
      end
    end
    
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to manage_entries_path, notice: 'Event was successfully updated.' }
        format.json { head :no_content }

        if @entry.update_attributes(params[:entry])
        end

      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
