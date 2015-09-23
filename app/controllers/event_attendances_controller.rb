class EventAttendancesController < ApplicationController
  def create
    @event = Event.find(params[:event_attendance][:attended_event_id])
    current_user.attend(@event)
    redirect_to @event
  end

  def destroy
    @event = EventAttendance.find(params[:id]).attended_event
    current_user.unattend(@event)
    redirect_to @event
  end
end
