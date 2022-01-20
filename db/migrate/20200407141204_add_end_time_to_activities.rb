class AddEndTimeToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :end_time, :datetime
  end
end
