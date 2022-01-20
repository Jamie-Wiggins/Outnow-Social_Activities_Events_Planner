require 'test_helper'

class ChatroomUserTest < ActiveSupport::TestCase

  # set up required objects
  setup do
    @user = User.new(avatar: '', email: 'user@gamil.com', username: 'username1', first_name: 'user', last_name: 'name', password: 'password123')
    assert @user.valid?
    assert @user.save
    
    @activity = Activity.new(title: "Activity Title", description: "Activity Description", host: "host", attendee_max: 5, start_time: DateTime.now ,finish_time: (Time.now + 1.day),
        longitude: 45,latitude: 45,icon: "icon",tags: "tags",color: "#FFFFFF",status: 1,host_rating: 5,image: '')
    
    @chatroom = Chatroom.new( name: "Chatroom Name", 
                              activity: @activity)
  end

  # failure case: should not save chatroom_user with no values present
  test "should not save chatroom_user with no values present" do
    chatroom_user = ChatroomUser.new

    refute chatroom_user.valid?
    refute chatroom_user.save
  end

  # success case: should save chatroom_user with valid parameters
  test "should save valid chatroom_user" do
    chatroom_user = ChatroomUser.new
    chatroom_user.user = @user
    chatroom_user.chatroom = @chatroom
    chatroom_user.hidden_name = "host"

    assert chatroom_user.valid?
    assert chatroom_user.save
  end

  # failure case: should not save chatroom_user with invalid user
  test "should not save chatroom_user with invalid user" do
    chatroom_user = ChatroomUser.new
    chatroom_user.chatroom = @chatroom
    chatroom_user.hidden_name = "anonymous"

    refute chatroom_user.valid?
    refute chatroom_user.save
  end

  # failure case: should not save chatroom_user with invalid chatroom
  test "should not save chatroom_user user with invalid chatroom" do
    chatroom_user = ChatroomUser.new
    chatroom_user.user = @user
    chatroom_user.hidden_name = "anonymous"

    refute chatroom_user.valid?
    refute chatroom_user.save
  end

  # failure case: should not save chatroom_user with invalid hidden name
  test "should not save chatroom_user user with invalid hidden name" do
    chatroom_user = ChatroomUser.new
    chatroom_user.user = @user
    chatroom_user.chatroom = @chatroom
    chatroom_user.hidden_name = "A"

    refute chatroom_user.valid?
    refute chatroom_user.save
  end

  # failure case: should not save chatroom_user with null hidden name
  test "should not save chatroom_user user with null hidden name" do
    chatroom_user = ChatroomUser.new
    chatroom_user.user = @user
    chatroom_user.chatroom = @chatroom

    refute chatroom_user.valid?
    refute chatroom_user.save
  end

end
