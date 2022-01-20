class ReportsController < ApplicationController
  before_action :set_chatroom, only: [:new, :create, :edit, :show, :update, :destroy]
  before_action :find_chatroomusers, only: [:create, :index, :show, :new, :edit] 
  before_action :authenticate_user!

  def new
    if @chatroom.activity.finish_time > DateTime.now
      @report = Report.new
    else
      redirect_to root_path
    end
  end

  def create 
    @report = @chatroom.reports.create(params[:report].permit(:title, :content, :username, :chatroom_id))
    #@report.user_id = current_user.id

    respond_to do |format|
      if @report.save
        format.html { redirect_to chatroom_path(@chatroom), notice: "user reported" }
        format.json { render :show, status: :created, location: @report }
        format.js
      else
        format.html { render new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def report_params
    params.require(:report).permit(:title, :content, :username)
  end

  def find_chatroomusers
    @chatroomusers = ChatroomUser.all.where("chatroom_id = ?", Chatroom.find_by_id(params[:id]))
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

end
