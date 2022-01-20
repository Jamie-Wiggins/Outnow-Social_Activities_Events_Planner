class AddIconRefToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :icon, :text
  end
end
