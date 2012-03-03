class MedicationsListController < ApplicationController
  def index
    @medications = Medication.all(:conditions => ["user_id = ?", current_user.id])
  end
end
