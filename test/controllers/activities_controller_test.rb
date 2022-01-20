require 'test_helper'

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # set up activity and user which is signed in
  setup do
    user = User.new(avatar: '', email: 'jad@gamil.com', username: 'jaasdmiewiggins', first_name: 'jamie', last_name: 'wiggins', password: 'jamie1234')
    user.save
    @user = user
    sign_in @user
  end
  
  # success case: should create new activity when user signed in
  test "should create new activity" do
    assert_difference('Activity.count') do
        post '/activities', params: {activity: {cost: '', host_rating: 4, title: "jamie", description: "jamie", host: "jamie", attendee_max: 12, 
        start_time: DateTime.now, finish_time: DateTime.now + 1.day, longitude: 2, latitude: 2, icon: "jamie",  tags: "jamie",  color: "#ffffff", status: 1}}
    end
      assert_redirected_to root_path
  end

  # success case: should create new activity when user signed in and has cost
  # test "should create new activity when user signed in and has cost" do
  #   assert_difference('Activity.count') do
  #       post '/activities', params: {activity: {cost: 50, host_rating: 4, title: "jamie", description: "jamie", host: "jamie", attendee_max: 12, start_time: DateTime.now, finish_time: DateTime.now + 1.day, longitude: 2, latitude: 2, icon: "jamie",  tags: "jamie",  color: "#ffffff", status: 1}}
  #   end
  #     assert_redirected_to root_path
  # end

  # fail case: should not create new activity when no user signed in
  test "should not create new activity when no user signed in" do
    sign_out @user
    assert_no_difference('Activity.count') do
        post '/activities', params: {activity: {host_rating: 4, description: "jamie", host: "jamie", attendee_max: 12, start_time: DateTime.now, finish_time: DateTime.now + 1.day, longitude: 2, latitude: 2, icon: "jamie",  tags: "jamie",  color: "#ffffff", status: 1}}
    end
    assert_redirected_to new_user_session_path
  end
      
  # success case: should get the new activity url
  test "new activity action should be success" do
    get root_path(Activity.new)
    assert_response :success
  end
end