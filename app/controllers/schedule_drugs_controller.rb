class ScheduleDrugsController < ApplicationController
  # GET /schedule_drugs
  # GET /schedule_drugs.json
  def index
    @schedule_drugs = ScheduleDrug.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedule_drugs }
    end
  end

  # GET /schedule_drug/1
  # GET /schedule_drug/1.json
  def show
    @schedule_drug = ScheduleDrug.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule_drug }
    end
  end

  # GET /schedule_drug/new
  # GET /schedule_drug/new.json
  def new
    @schedule_drug = ScheduleDrug.new
    @drugs = Drug.all.map { |d| [d.name, d.id] }
    #@drugs = Drug.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule_drug }
    end
  end

  # GET /schedule_drug/1/edit
  def edit
    @schedule_drug = ScheduleDrug.find(params[:id])
    @entry = Entry.find(:first, :conditions => ["schedule_drug_id = ?", @schedule_drug.id])
    
    #checks to see if this medication has an alert to check the has_alert checkbox
    alerts = Alert.all(:conditions => ["schedule_drug_id = ?", @schedule_drug.id])
    @alert_first = alerts[0]
    
    @drugs = Drug.all.map { |d| [d.name, d.id] }
    
    if @alert_first
      @has_alert = true
    end
  end

  # POST /schedule_drugs
  # POST /schedule_drugs.json
  def create
    @schedule_drug = ScheduleDrug.new(params[:schedule_drug])

    @schedule_drug.user = current_user

    respond_to do |format|
      if @schedule_drug.save
        format.html { redirect_to @schedule_drug, notice: 'Schedule Drug was successfully created.' }
        format.json { render json: @schedule_drug, status: :created, location: @schedule_drug }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule_drug.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_schedule_drug_entry

    @schedule_drug = ScheduleDrug.new(params[:schedule_drug])
    schedule_id = -1
    
    drug_id = params[:drug][:drug_id]
    @schedule_drug.drug_id = drug_id
    
    if session[:managing_patient]
      @schedule_drug.user = User.find(session[:patient_id])
      schedule_id = session[:patient_schedule_id]
    else
      @schedule_drug.user = current_user
      schedule_id = session[:schedule_id]
    end
    
    @entry = @schedule_drug.build_entry(params[:entry])
    
    respond_to do |format|
      if @schedule_drug.save
        format.html { redirect_to manage_entries_path, notice: 'Schedule Drug was successfully created.' }
        format.json { render json: @schedule_drug, status: :created, location: @schedule_drug }

        @entry.schedule_drug_id = @schedule_drug.id
        @entry.schedule_id = schedule_id
        has_alert = params[:has_alert]
        
        if @entry.save
          if has_alert
            @alert = @schedule_drug.create_alert(params[:alert])
            @alert.alert_time = @entry.start_time
            @alert.save

            UserMailer.enqueue_alert_email(current_user, @alert)

            @schedule_drug.alert_id = @alert.id
            @schedule_drug.save
          end
        end

      else
        format.html { render action: "new" }
        format.json { render json: @schedule_drug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medications/1
  # PUT /medications/1.json
  #def update
  #  @medication = Medication.find(params[:id])
  #
  #  respond_to do |format|
  #    if @medication.update_attributes(params[:medication])
  #      format.html { redirect_to @medication, notice: 'Medication was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @medication.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  def update
    @schedule_drug = ScheduleDrug.find(params[:id])
    @entry = Entry.find(:first, :conditions => ["schedule_drug_id = ?", @schedule_drug.id])


    if params[:commit] == "Update Scheduled Drug"
      drug_id = params[:drug][:drug_id]
      @schedule_drug.drug_id = drug_id

      alert_checked = params[:has_alert]
      alerts = Alert.all(:conditions => ["schedule_drug_id = ?", @schedule_drug.id])
      alert_exists = alerts[0]
    
      if alert_checked
        if !alert_exists
          alert = @schedule_drug.create_alert
          @schedule_drug.alert_id = alert.id
          @schedule_drug.save
        end
      else  
        if alert_exists
          @schedule_drug.alert_id = nil
          @schedule_drug.save
          Alert.delete(alert_exists.id)
        end
      end
      
      respond_to do |format|
        if @schedule_drug.update_attributes(params[:schedule_drug])
          format.html { redirect_to manage_entries_path, notice: 'Schedule Drug was successfully updated.' }
          format.json { head :no_content }

          if @entry.update_attributes(params[:entry])
          end

        else
          format.html { render action: "edit" }
          format.json { render json: @schedule_drug.errors, status: :unprocessable_entity }
        end
      end
      
    elsif params[:commit] == "Resolve Drug"
      @schedule_drug = ScheduleDrug.find(params[:id])
      @entry = Entry.find(:first, :conditions => ["schedule_drug_id = ?", @schedule_drug.id])

      respond_to do |format|
        if @entry.update_attributes(params[:entry])

          #update the schedule_drugs_conflict table
          schedule_drugs_conflicts = ScheduleDrugsConflict.all(:conditions => ["schedule_drug1_id = ? or schedule_drug2_id = ?", @schedule_drug.id, @schedule_drug.id])

          for conflict in schedule_drugs_conflicts
            if conflict.schedule_drug1_id == @schedule_drug.id
              schedule_drug1 = ScheduleDrug.find(conflict.schedule_drug1_id)
              schedule_drug2 = ScheduleDrug.find(conflict.schedule_drug2_id)
              drug_time_conflict = DrugTimeConflict.find(:first, :conditions => ["drug1_id = ? and drug2_id = ?", schedule_drug1.drug_id, schedule_drug2.drug_id])

              new_diff = schedule_drug1.entry.start_time - schedule_drug2.entry.start_time

              if new_diff.abs > drug_time_conflict.conflict_time
                ScheduleDrugsConflict.delete_all(:schedule_drug1_id => schedule_drug1.id, :schedule_drug2_id => schedule_drug2.id)
              else
                puts "conflict still exists!"
              end
            else
              schedule_drug1 = ScheduleDrug.find(conflict.schedule_drug1_id)
              schedule_drug2 = ScheduleDrug.find(conflict.schedule_drug2_id)
              drug_time_conflict = DrugTimeConflict.find(:first, :conditions => ["drug1_id = ? and drug2_id = ?", schedule_drug1.drug_id, schedule_drug2.drug_id])

              new_diff = schedule_drug1.entry.start_time - schedule_drug2.entry.start_time

              if new_diff.abs > drug_time_conflict.conflict_time
                ScheduleDrugsConflict.delete_all(:schedule_drug1_id => schedule_drug1.id, :schedule_drug2_id => schedule_drug2.id)
              else
                puts "conflict still exists!"
              end
            end
          end

          format.html { redirect_to manage_entries_path, notice: 'Schedule Drug Entry was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @entry.errors, status: :unprocessable_entity }
        end
      end
    else
      puts "unknown commit for update schedule_drugs"
    end
  end

  # DELETE /schedule_drugs/1
  # DELETE /schedule_drugs/1.json
  def destroy
    @schedule_drug = ScheduleDrug.find(params[:id])
    @schedule_drug.destroy

    respond_to do |format|
      format.html { redirect_to manage_entries_path }
      format.json { head :no_content }
    end
  end

  # GET /schedule_drugs/1/unresolved
  def unresolved
    @schedule_drug = ScheduleDrug.find(params[:id])
    @entry = Entry.find(:first, :conditions => ["schedule_drug_id = ?", @schedule_drug.id])
  end

  # GET /schedule_drugs/1/resolve
  def resolve
    
  end

end
