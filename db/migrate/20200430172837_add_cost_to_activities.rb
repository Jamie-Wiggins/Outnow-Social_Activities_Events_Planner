class AddCostToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :cost, :integer
  end
end
