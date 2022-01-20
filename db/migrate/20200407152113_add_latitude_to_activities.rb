class AddLatitudeToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :latitude, :decimal
  end
end
