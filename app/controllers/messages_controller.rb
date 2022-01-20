class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_chatroom

  def destroy
    @message = @chatroom.messages.where(chatroom_id: @chatroom_id).destroy_all
    redirect_to root_path
  end

private
  def set_message
    @message = Message.find(params[:id])
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end