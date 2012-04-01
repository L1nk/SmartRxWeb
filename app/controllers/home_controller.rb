class HomeController < ApplicationController
  
  def index
    
    get_schedule_info(current_user)
    
    schedule_drugs = ScheduleDrug.all(:conditions => ["user_id = ?", current_user.id])
    for schedule_drug1 in schedule_drugs
      for schedule_drug2 in schedule_drugs

        #make sure we're not comparing the same schedule_drug
        if schedule_drug1.id != schedule_drug2.id && schedule_drug1.id < schedule_drug2.id
          
          med_conflicts = MedicationConflict.all

          conflict_possible = false
          for conflict in med_conflicts
            if conflict.medication1_id == schedule_drug1.drug_id && conflict.medication2_id == schedule_drug2.drug_id
              conflict_possible = true
            end
          end

          diff = schedule_drug1.entry.start_time - schedule_drug2.entry.start_time
          
          #make sure the conflict doesn't already exist
          schedule_drug_conflicts = ScheduleDrugsConflict.all(:conditions => ["schedule_drug1_id = ?", schedule_drug1.id])
          for conflict in schedule_drug_conflicts
            if conflict.schedule_drug2_id == schedule_drug2.id
              conflict_possible = false
              break
            end
          end

          schedule_drug_conflicts = ScheduleDrugsConflict.all(:conditions => ["schedule_drug2_id = ?", schedule_drug1.id])
          for conflict in schedule_drug_conflicts
            if conflict.schedule_drug1_id == schedule_drug2.id
              conflict_possible = false
              break
            end
          end
          
          #add conflict to table if it doesn't exist
          if conflict_possible && diff.abs < 3600
            conflict = ScheduleDrugsConflict.create(schedule_drug1_id: schedule_drug1.id,
						    schedule_drug2_id: schedule_drug2.id,
						    reason: "time conflict")
            conflict.user_id = current_user.id
            conflict.save

            schedule_drug1.has_conflict = true
            schedule_drug1.save

            schedule_drug2.has_conflict = true
            schedule_drug2.save

            relation1 = ScheduleDrugsConflictManagement.new
            relation1.schedule_drug = schedule_drug1
            relation1.schedule_drugs_conflict = conflict
            relation1.save

            relation2 = ScheduleDrugsConflictManagement.new
            relation2.schedule_drug = schedule_drug2
            relation2.schedule_drugs_conflict = conflict
            relation2.save

            current_user.has_schedule_drug_conflict = true
            current_user.save
          end
          
        end

      end
    end
    
    if session[:managing_patient]
      session[:managing_patient] = false
      session[:patient_id] = -1
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @all_entries }
    end
  end

  #helper functions
  def get_schedule_info(user)
    schedule = Schedule.all(:conditions => ["user_id = ?", user.id])
    @schedule = schedule[0]
    
    event_entries = Entry.all(:conditions => ["schedule_id = ?", @schedule.id], :joins => :event, :include => :event)
    schedule_drug_entries = Entry.all(:conditions => ["schedule_id = ?", @schedule.id], :joins => :schedule_drug, :include => :schedule_drug)
    
    @date = params[:month] ? Date.strptime(params[:month], '%Y-%m') : Date.today

    count = 0
    @all_entries = []

    for event in event_entries
      @all_entries[count] = event
      count += 1
    end

    for schedule_drug in schedule_drug_entries
      @all_entries[count] = schedule_drug
      count += 1
    end
  end

end
