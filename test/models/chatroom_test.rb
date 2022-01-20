require 'test_helper'

class ChatroomTest < ActiveSupport::TestCase

  setup do
    @user = User.new(avatar: '', email: 'user@gamil.com', username: 'username1', first_name: 'user', last_name: 'name', password: 'password123')
    assert @user.valid?
    assert @user.save

    @activity = Activity.new(title: "Activity Title", description: "Activity Description", host: "host", attendee_max: 5, start_time: DateTime.now ,finish_time: (Time.now + 1.day),
    longitude: 45,latitude: 45,icon: "icon",tags: "tags",color: "#FFFFFF",status: 1,host_rating: 5,image: '')
  end


  # failure case: should not save chatroom with no values present
  test "should not save chatroom with no values present" do
    chatroom = Chatroom.new
    refute chatroom.valid?
    refute chatroom.save
  end

  # success case: should save chatroom with valid parameters
  test "should save valid chatroom" do
    chatroom = Chatroom.new
    chatroom.name = @activity.title
    chatroom.activity = @activity
    assert chatroom.valid?
    assert chatroom.save
  end

  # success case: should not save chatroom with null name
  test "should not save chatroom with null name" do
    chatroom = Chatroom.new
    chatroom.activity = @activity
    refute chatroom.valid?
    refute chatroom.save
  end

  # success case: should not save chatroom with invalid name
  test "should not save chatroom with name less than 3 long" do
    chatroom = Chatroom.new
    chatroom.name = "a"
    chatroom.activity = @activity
    refute chatroom.valid?
    refute chatroom.save
  end

  # success case: should not save chatroom with invalid name
  test "should not save chatroom with name more than 30 long" do
    chatroom = Chatroom.new
    chatroom.name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    chatroom.activity = @activity
    refute chatroom.valid?
    refute chatroom.save
  end

  # success case: should not save chatroom with null activity
  test "should not save chatroom user with null activity" do
    chatroom = Chatroom.new
    chatroom.name = @activity.title
    refute chatroom.valid?
    refute chatroom.save
  end
end
