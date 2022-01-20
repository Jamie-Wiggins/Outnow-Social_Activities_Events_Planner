class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :find_icons, only: [:index, :show, :new, :edit] 
  before_action :find_categories, only: [:index, :show, :new, :edit] 
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @activity = Activity.new
        
    @rating = Rating.all.where("rating_for = ?", current_user.id)
    
    if @rating.exists?
      @rating.each do |r|
      @final_rating2 = r.rating / @rating.count
      end
    else
      @final_rating2 = 5
    end


  end
  
  def show
    respond_to do |format|
      format.js
    end
  end

  def index
    @activities = Activity.all
  end
  
  def create
    @activity = Activity.new(activity_params)
    
    if @activity.cost.to_i < 0
      @activity.cost = @activity.cost*100
    end

    respond_to do |format|
      
      if @activity.save
        format.html { redirect_to root_path, notice: "" }
        format.json { render :show, status: :created, location: @activity }
        format.js
      else
        format.html { render new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
    Activity.afterCreate(@activity, current_user.id)
    Activity.afterCreate2(@activity, current_user.id)
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to root_path, notice: "" }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @activity.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: ""}
        format.json { head :no_content }
      end
  end

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_chatroom
      @chatroom = Chatroom.find(params[:id])
    end

    def find_icons
      @icons = Icon.all.order('created_at desc')
    end

    def find_categories
      @categories = Category.all.order('created_at desc')
    end
  
    # Post params allows content, color, text color, font type, font size and group id to pass through
    def activity_params
      params.require(:activity).permit(:title, :description, :status, :attendee_max, :cost, :host, :host_rating, :start_time, :finish_time, :longitude, :latitude, :image, :color, :icon, :tags)
    end
end