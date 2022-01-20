class AddLongitudeToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :longitude, :decimal
  end
end
