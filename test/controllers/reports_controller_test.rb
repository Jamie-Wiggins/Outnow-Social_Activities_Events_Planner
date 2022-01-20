require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  
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

    @chatroom = Chatroom.new
    @chatroom.name = activity.title
    @chatroom.activity = activity
    assert @chatroom.valid?
    assert @chatroom.save


  end

  test "should create report when user signed in" do
    sign_in @user
    assert_difference('Report.count') do
      post "/chatrooms/#{@chatroom.id.to_s}/reports", params: {chatroom_id: @chatroom.id, report: {title: "Report Title", content: "Report Content", username: @user.username}}
    end
    assert_redirected_to chatroom_path(@chatroom.id)
  end

  test "should not create report when user signed out" do
    assert_no_difference('Report.count') do
      post "/chatrooms/#{@chatroom.id.to_s}/reports", params: {chatroom_id: @chatroom.id, report: {title: "Report Title", content: "Report Content", username: @user.username}}
    end
    assert_redirected_to new_user_session_path
  end
end