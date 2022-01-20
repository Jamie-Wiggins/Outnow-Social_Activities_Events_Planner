class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_messages
  before_action :find_activities

  def index
    @chatrooms = Chatroom.all 
    chat_user = ChatroomUser.all.where(:user_id => current_user.id)
  end

  def show
    @checkUser = ChatroomUser.where(:chatroom_id => Chatroom.find_by_id(params[:id]), :user_id => current_user.id)

    if @chatroom.activity.finish_time > DateTime.now && @checkUser.exists?
      @chatroom_users = ChatroomUser.all.where("user_id = ?", current_user)
      @activity = Activity.find(@chatroom.activity_id)
      
      @messages = Message.all.order('created_at asc').where("chatroom_id = ?", Chatroom.find_by_id(params[:id]))
      @jamie = ChatroomUser.where(:chatroom_id => Chatroom.find_by_id(params[:id]), :user_id => current_user.id)
      @jamie2 = ChatroomUser.all.where(:chatroom_id => Chatroom.find_by_id(params[:id]))
      chat_user = ChatroomUser.all.where(:user_id => current_user.id)
      @jamie2 = Chatroom.where(id: chat_user.map(&:chatroom_id))
    else
      redirect_to root_path
    end
  end


  def destroy
    @chatroom.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: ""}
      format.json { head :no_content }
    end
  end

  private
    def set_chatroom
      @chatroom = Chatroom.find(params[:id])
    end
    
    def set_messages
      @messages = Message.all
    end

    def chatroom_params
      params.require(:chatroom).permit(:name)
    end

    def find_activities
      @activities = Activity.all.order('created_at desc')
    end
end
