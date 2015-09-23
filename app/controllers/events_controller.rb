class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @creator = @event.creator
    @attendees = @event.attendees
  end

  def index
    @events = Event.all
    @upcoming_events = Event.future
    @prev_events = Event.past
  end

  private

    def event_params
      params.require(:event).permit(:title, :date, :location, :description)
    end
end
