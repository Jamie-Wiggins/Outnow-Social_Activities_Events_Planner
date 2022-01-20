class RemoveUserFromActivities < ActiveRecord::Migration[6.0]
  def change
    remove_reference :activities, :user, foreign_key: true
  end
end
