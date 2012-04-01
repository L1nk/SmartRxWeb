class HomeController < ApplicationController
  
  def index
    
    get_schedule_info(current_user)
    
    schedule_drugs = ScheduleDrug.all(:conditions => ["user_id = ?", current_user.id])
    conflict_exists = false
    for schedule_drug1 in schedule_drugs
      for schedule_drug2 in schedule_drugs

        #make sure we're not comparing the same schedule_drug
        if schedule_drug1.id != schedule_drug2.id && schedule_drug1.drug_id < schedule_drug2.drug_id

          med_conflicts = MedicationConflict.all
          conflict_type = -1

          conflict_possible = false
          for conflict in med_conflicts
            if conflict.medication1_id == schedule_drug1.drug_id && conflict.medication2_id == schedule_drug2.drug_id
              conflict_possible = true
              conflict_type = conflict.conflict_type
            end
          end

          if conflict_possible
            
            diff = schedule_drug1.entry.start_time - schedule_drug2.entry.start_time
            
            #make sure the conflict doesn't already exist
            schedule_drugs_conflict = ScheduleDrugsConflict.find(:first, :conditions => ["schedule_drug1_id = ? and schedule_drug2_id = ?", schedule_drug1.id, schedule_drug2.id])

            if schedule_drugs_conflict
              conflict_possible = false
              conflict_exists = true
            end

            schedule_drugs_conflict = ScheduleDrugsConflict.find(:first, :conditions => ["schedule_drug1_id = ? and schedule_drug2_id = ?", schedule_drug2.id, schedule_drug1.id])

            if schedule_drugs_conflict
              conflict_possible = false
              conflict_exists = true
            end
            
            #add conflict to table if it doesn't exist
            if conflict_possible
              case conflict_type
	      when 1 #case of time conflict between two drugs
                conflict = DrugTimeConflict.find(:first, :conditions => ["drug1_id = ? and drug2_id = ?", schedule_drug1.drug_id, schedule_drug2.drug_id])
                
                if diff.abs < conflict.conflict_time
                  conflict = ScheduleDrugsConflict.create(schedule_drug1_id: schedule_drug1.id,
						          schedule_drug2_id: schedule_drug2.id,
						          reason: "time conflict")
	          conflict.user_id = current_user.id
	          conflict.save

	          schedule_drug1.has_conflict = true
	          schedule_drug1.save

	          schedule_drug2.has_conflict = true
	          schedule_drug2.save

	          current_user.has_schedule_drug_conflict = true
	          current_user.save
	          
	          conflict_exists = true
                end
              else
                puts "invalid type"
              end #end of case statement
            end #conflict_possible
          end #conflict_possible
        end
      end #inner for
    end #outer for

    if !conflict_exists
      current_user.has_schedule_drug_conflict = false
      current_user.save
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
