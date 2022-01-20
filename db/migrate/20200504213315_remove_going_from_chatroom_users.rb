class RemoveGoingFromChatroomUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :chatroom_users, :going, :integer
  end
end
