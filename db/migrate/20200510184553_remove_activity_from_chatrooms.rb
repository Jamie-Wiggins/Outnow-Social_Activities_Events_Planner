class RemoveActivityFromChatrooms < ActiveRecord::Migration[6.0]
  def change
    remove_reference :chatrooms, :activity, foreign_key: true
  end
end
