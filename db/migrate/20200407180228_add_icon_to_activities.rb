class AddIconToActivities < ActiveRecord::Migration[6.0]
  def change
    add_reference :activities, :icon, null: true, foreign_key: true
  end
end
