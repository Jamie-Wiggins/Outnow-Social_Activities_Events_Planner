class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home, :terms, :about_us, :contact_us]

  def home
    @activities = Activity.all.order('created_at desc')
    @activity = Activity.new

    gon.activities = @activities

    @messages = Message.all.where("chatroom_id = ?", Chatroom.find_by_id(params[:id]))  
    
    @activities.each do |expired_activity|
      Activity.expired_activity(expired_activity)
    end 

    if user_signed_in?
      chat_user = ChatroomUser.all.where(:user_id => current_user.id)
      chatroom = Chatroom.all.where(id: chat_user.map(&:chatroom_id))
      @userattended = Activity.where(id: chatroom.map(&:activity_id))
      
      @tweets = Tweet.all.where("user_id = ?",current_user.id) # where user id == current user
      gon.tweets = @tweets
      gon.attendedActivities = @userattended
      gon.userTags = current_user.user_tags

      
      @rating = Rating.all.where("rating_for = ?", current_user.id)
      @rating.each do |r|
        @final_rating = r.rating / @rating.count
      end
    end
  end

  def change_avatar
    current_user.avatar = (params[:user][:avatar])
    current_user.save!
    redirect_back(fallback_location: root_path)
  end

  def legal
  end

  def contact_us
    ContactUsMailer.contact_email(:name, :email, :message).deliver_now
  end

  def request_contact
    name = params[:name]
    email = params[:email]
    message = params[:message]
    
    if email.blank?
      flash[:alert] = ('You must provide an email address.')
    else
      flash[:notice] = ('contact form sent!')
    end

    redirect_to root_path 
  end 

  def about_us
    @posts = Post.all
  end

  def activity_index
    @activities = Activity.all
    @activity = Activity.new
  end

  def profile
    if (User.find_by_username(params[:id]))
        @username = params[:id]
      if
        (@username != current_user.username)
        redirect_to root_path
      end      
    else 
        redirect_to root_path, :notice=> "profile not found"
    end
    chat_user = ChatroomUser.all.where(:user_id => current_user.id)
    chatroom = Chatroom.all.where(id: chat_user.map(&:chatroom_id))
    @userattended = Activity.where(id: chatroom.map(&:activity_id))

    @chatroom_users = ChatroomUser.all.where("user_id = ?", current_user.id)

    @rating = Rating.all.where("rating_for = ?", current_user.id)
    @rating.each do |r|
      @final_rating = r.rating / @rating.count
    end

  end
end
