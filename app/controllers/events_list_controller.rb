class EventsListController < ApplicationController
  def index
    @events = Event.all(:conditions => ["user_id = ?", current_user.id])
  end
end
