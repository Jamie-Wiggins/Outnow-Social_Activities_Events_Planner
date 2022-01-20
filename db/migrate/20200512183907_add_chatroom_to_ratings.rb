class AddChatroomToRatings < ActiveRecord::Migration[6.0]
  def change
    add_reference :ratings, :chatroom, foreign_key: true
  end
end
