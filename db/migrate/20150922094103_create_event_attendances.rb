class CreateEventAttendances < ActiveRecord::Migration
  def change
    create_table :event_attendances do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps null: false
    end
  end
end
