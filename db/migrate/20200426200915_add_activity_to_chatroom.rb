class AddActivityToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :activity, foreign_key: true
  end
end
