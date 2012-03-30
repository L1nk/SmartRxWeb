class MedicationsListController < ApplicationController
  def index
    @schedule_drugs = ScheduleDrug.all(:conditions => ["user_id = ?", current_user.id])
  end
end
