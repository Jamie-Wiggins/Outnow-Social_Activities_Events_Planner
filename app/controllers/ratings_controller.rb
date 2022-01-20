class RatingsController < ApplicationController
  before_action :set_chatroom, only: [:new, :create, :edit, :show, :update, :destroy]
  before_action :find_chatroomusers, only: [:create, :index, :show, :new, :edit] 
  before_action :authenticate_user!

def new
  if @chatroom.activity.finish_time < DateTime.now
  @rating = Rating.new
  else
    redirect_to chatroom_path(@chatroom)
  end
end

def create
  @rating = @chatroom.ratings.where(user_id: current_user.id).new(rating_params)

  respond_to do |format|
    if @rating.save
      format.html { redirect_to chatroom_path(@chatroom), notice: "user reported" }
      format.json { render :show, status: :created, location: @rating }
      format.js
    else
      format.html { render new }
      format.json { render json: @rating.errors, status: :unprocessable_entity }
    end
  end
end

private
  def rating_params
    params.require(:rating).permit(:rating, :rating_for)
  end

  
  def find_chatroomusers
    @chatroomusers = ChatroomUser.all.where("chatroom_id = ?", Chatroom.find_by_id(params[:id]))
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end
end
