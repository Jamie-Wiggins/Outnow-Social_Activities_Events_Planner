class AddHiddenNameToChatroomUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :chatroom_users, :hidden_name, :string
  end
end
