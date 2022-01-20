class AddAttendeeMaxToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :attendee_max, :integer
  end
end
