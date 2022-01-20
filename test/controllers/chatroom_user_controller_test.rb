require 'test_helper'

class ChatroomUserControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new
    @user.email = 'steve1@outnow.com'
    @user.username = 'steve1'
    @user.first_name = 'steve'
    @user.last_name = 'elliott'
    @user.password = 'password123'
    assert @user.save

    @user2 = User.new
    @user2.email = 'steve2@outnow.com'
    @user2.username = 'steve2'
    @user2.first_name = 'steve'
    @user2.last_name = 'elliott'
    @user2.password = 'password123'
    assert @user2.save

    @activity = Activity.new
    @activity.title = 'Controller Test'
    @activity.description = 'description'
    @activity.host = @user.username
    @activity.host_rating = 5
    @activity.attendee_max = 5
    @activity.start_time = Time.now
    @activity.finish_time = (Time.now + 1.day)
    @activity.longitude = 1
    @activity.latitude = 1
    @activity.icon = 'icon'
    @activity.tags = 'tags'
    @activity.color = '#FFFFFF'
    @activity.status = 1
    @activity.cost = 0
    assert @activity.save

    @random_name = RandomName.new
    @random_name.username = "bewildered shallot"
    assert @random_name.valid?
    assert @random_name.save

    @chatroom = Chatroom.new
    @chatroom.name = @activity.title
    @chatroom.activity = @activity
    assert @chatroom.valid?
    assert @chatroom.save
  end

  # success case: create new chatroom user when user signed in
  test "should create new chatroom user" do
    assert sign_in @user2
    assert_difference('ChatroomUser.count') do
      post "/chatrooms/#{@chatroom.id.to_s}/chatroom_users", params: {chatroom_id: @chatroom.id}
    end
    assert_redirected_to root_path
  end

  # failure case: do not create new chatroom user when user signed out
  test "should not create new chatroom user when user signed out" do
    assert_no_difference('ChatroomUser.count') do
      post "/chatrooms/#{@chatroom.id.to_s}/chatroom_users", params: {chatroom_id: @chatroom.id}
    end
    assert_redirected_to new_user_session_path
  end

  # success case: destroy chatroom user when user signed in
  test "destroy chatroom user when user signed in" do
    assert sign_in @user2
    assert_difference('ChatroomUser.count') do
      post "/chatrooms/#{@chatroom.id.to_s}/chatroom_users", params: {chatroom_id: @chatroom.id}
    end
    assert_redirected_to root_path
    assert_difference('ChatroomUser.count', -1) do
      delete "/chatrooms/#{@chatroom.id.to_s}/chatroom_users"
    end
    assert_redirected_to root_path
  end
end
