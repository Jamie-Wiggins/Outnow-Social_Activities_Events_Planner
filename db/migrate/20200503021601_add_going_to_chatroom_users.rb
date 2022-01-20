class AddGoingToChatroomUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :chatroom_users, :going, :integer
  end
end
