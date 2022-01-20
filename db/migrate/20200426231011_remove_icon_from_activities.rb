class RemoveIconFromActivities < ActiveRecord::Migration[6.0]
  def change
    remove_reference :activities, :icon, foreign_key: true
  end
end
