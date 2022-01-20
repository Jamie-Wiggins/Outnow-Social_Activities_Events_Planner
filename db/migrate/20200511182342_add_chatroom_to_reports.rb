class AddChatroomToReports < ActiveRecord::Migration[6.0]
  def change
    add_reference :reports, :chatroom, foreign_key: true
  end
end
