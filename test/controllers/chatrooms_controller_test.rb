require 'test_helper'

class ChatroomsControllerTest < ActionDispatch::IntegrationTest
  
  # set up test database
  setup do
    @user = User.new
    @user.email = 'steve1@outnow.com'
    @user.username = 'steve1'
    @user.first_name = 'steve'
    @user.last_name = 'elliott'
    @user.password = 'password123'
    assert @user.valid?
    assert @user.save

    activity = Activity.new
    activity.title = 'Controller Test'
    activity.description = 'description'
    activity.host = @user.username
    activity.host_rating = 5
    activity.attendee_max = 5
    activity.start_time = Time.now
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 0
    activity.latitude = 0
    activity.icon = 'icon'
    activity.tags = 'tags'
    activity.color = '#FFFFFF'
    activity.status = 1
    activity.cost = 0
    assert activity.valid?
    assert activity.save

    random_name = RandomName.new
    random_name.username = "respectful frog"
    assert random_name.valid?
    assert random_name.save

    @chatroom = Chatroom.new
    @chatroom.name = activity.title
    @chatroom.activity = activity
    assert @chatroom.valid?
    assert @chatroom.save

    chatroom_user = ChatroomUser.new
    chatroom_user.user = @user
    chatroom_user.chatroom = @chatroom
    chatroom_user.hidden_name = random_name.username
    assert chatroom_user.valid?
    assert chatroom_user.save
  end

  # success case: create new chatroom
  test "should route to chatroom index" do
    get "/chatrooms"   
  end

  # success case: show chatroom details
  test "should show chatroom details" do
    sign_in @user
    get "/chatrooms/#{@chatroom.id.to_s}"
    assert_redirected_to root_path
  end

  # no route for destroy chatroom?

  # # success case: destroys chatroom when signed in
  # test "should destroy chatroom when signed in" do
  #   sign_in @user
  #   assert_difference('Chatroom.count', -1) do
  #     delete "/chatrooms/#{@chatroom.id.to_s}"
  #   end
  #   assert_redirected_to root_path
  # end

  # # failure case: does not destroy chatroom when signed out
  # test "should not destroy chatroom when signed out" do
  #   assert_no_difference('Chatroom.count') do
  #     delete "/chatrooms/#{@chatroom.id.to_s}"
  #   end
  #   assert_redirected_to new_user_session_path
  # end

end
