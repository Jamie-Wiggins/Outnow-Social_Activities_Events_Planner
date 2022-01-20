class AddStartTimeToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :start_time, :datetime
  end
end
