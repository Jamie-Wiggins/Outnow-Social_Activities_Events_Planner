class AddFinishTimeToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :finish_time, :datetime
  end
end
