class User < ActiveRecord::Base
  has_many :events, foreign_key: "creator_id", dependent: :destroy
  has_many :event_attendances, foreign_key: "attendee_id", dependent: :destroy
  has_many :attended_events, through: :event_attendances

  def upcoming
    self.attended_events.upcoming_events
  end

  def previous
    self.attended_events.previous_events
  end

  def attend(event)
    event_attendances.create(attended_event_id: event.id)
  end

  def unattend(event)
    event_attendances.find_by(attended_event_id: event.id).destroy
  end

  def attending?(event)
    event.attendees.include?(self)
  end
end
