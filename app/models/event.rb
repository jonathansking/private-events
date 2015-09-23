class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :event_attendances, foreign_key: "attended_event_id"
  has_many :attendees, through: :event_attendances

  scope :upcoming_events, -> { where("date >= ?", DateTime.now) }
  scope :previous_events, -> { where("date < ?", DateTime.now) }

  def self.future
    self.all.upcoming_events
  end

  def self.past
    self.all.previous_events
  end
end
