class MessagesChannel < ApplicationCable::Channel
  def subscribed
    current_user.chatrooms.each do |chatroom|
      stream_from "chatrooms:#{chatroom.id}"
    end
  end
  
  def unsubscribed
    stop_all_streams
  end
  
  def send_message(data)

    @chatroom = Chatroom.find(data["chatroom_id"])
       
    @jamie = ChatroomUser.all.where("user_id = ?", current_user.id)

      @jamie.each do |j|
        if @chatroom.id == j.chatroom_id
          @here = j
        end
      end   

    message = @chatroom.messages.create(body: data["body"], sender: current_user.id, user: current_user, hidden_name: @here.hidden_name)
    MessageRelayJob.perform_later(message)
  end 
end
