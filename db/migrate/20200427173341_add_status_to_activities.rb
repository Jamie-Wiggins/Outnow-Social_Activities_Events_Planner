class AddStatusToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :status, :integer
  end
end
