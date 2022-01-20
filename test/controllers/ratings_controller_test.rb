require 'test_helper'

class RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new
    @user.email = 'steve1@outnow.com'
    @user.username = 'steve1'
    @user.first_name = 'steve'
    @user.last_name = 'elliott'
    @user.password = 'password123'
    assert @user.valid?
    assert @user.save

    @user2 = User.new
    @user2.email = 'steve2@outnow.com'
    @user2.username = 'steve2'
    @user2.first_name = 'steve'
    @user2.last_name = 'elliott'
    @user2.password = 'password123'
    assert @user2.valid?
    assert @user2.save

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

    @chatroom = Chatroom.new
    @chatroom.name = activity.title
    @chatroom.activity = activity
    assert @chatroom.valid?
    assert @chatroom.save

    random_name = RandomName.new
    random_name.username = "humble pear"
    assert random_name.valid?
    assert random_name.save

    chatroom_user = ChatroomUser.new
    chatroom_user.user = @user
    chatroom_user.chatroom = @chatroom
    chatroom_user.hidden_name = random_name.username
    assert chatroom_user.valid?
    assert chatroom_user.save

    random_name = RandomName.new
    random_name.username = "exotic potato"
    assert random_name.valid?
    assert random_name.save

    chatroom_user = ChatroomUser.new
    chatroom_user.user = @user2
    chatroom_user.chatroom = @chatroom
    chatroom_user.hidden_name = random_name.username
    assert chatroom_user.valid?
    assert chatroom_user.save
  end

  # test "new rating" do
  #   sign_in @user2
  #   assert_difference('Rating.count') do
  #     get "/chatrooms/#{@chatroom.id.to_s}/ratings/new"
  #   end
  # end

  test "should create rating" do
    sign_in @user2
    assert_difference('Rating.count') do
      post "/chatrooms/#{@chatroom.id.to_s}/ratings", params: {chatroom_id: @chatroom.id, rating: {rating: 5, rating_for: @user.id}}
    end
    assert_redirected_to chatroom_path(@chatroom)
  end

  test "should not create rating when user signed out" do
    assert_no_difference('Rating.count') do
      post "/chatrooms/#{@chatroom.id.to_s}/ratings", params: {chatroom_id: @chatroom.id, rating: {rating: 5, rating_for: @user.id}}
    end
    assert_redirected_to new_user_session_path
  end
end
