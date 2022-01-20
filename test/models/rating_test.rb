require 'test_helper'

class RatingTest < ActiveSupport::TestCase

  setup do
    @user = User.new(avatar: '', email: 'user@gamil.com', username: 'username1', first_name: 'user', last_name: 'name', password: 'password123')
    assert @user.valid?
    assert @user.save

    @user2 = User.new(avatar: '', email: 'user2@gamil.com', username: 'username2', first_name: 'user', last_name: 'name', password: 'password123')
    assert @user2.valid?
    assert @user2.save

    @activity = Activity.new(title: "Activity Title", description: "Activity Description", host: "host", attendee_max: 5, start_time: DateTime.now ,finish_time: (Time.now + 1.day),
        longitude: 45,latitude: 45,icon: "icon",tags: "tags",color: "#FFFFFF",status: 1,host_rating: 5,image: '')

    @chatroom = Chatroom.new(name: @activity.title, activity: @activity)

  end

  # failure case: should not save rating with no values present
  test "should not save rating with no values present" do
    rating = Rating.new
    refute rating.valid?
    refute rating.save
  end

  # success case: should save rating with valid parameters
  test "should save valid rating" do
    rating = Rating.new
    rating.rating = 5
    rating.user = @user
    rating.chatroom = @chatroom
    rating.rating_for = @user2.id
    assert rating.valid?
    assert rating.save
  end

  # success case: should not save rating with null rating
  test "should not save rating with null rating" do
    rating = Rating.new
    rating.user = @user
    rating.chatroom = @chatroom
    rating.rating_for = @user2.id
    refute rating.valid?
    refute rating.save
  end

  # success case: should not save rating with invalid rating
  test "should not save rating with rating less than 0" do
    rating = Rating.new
    rating.rating = -1
    rating.user = @user
    rating.chatroom = @chatroom
    rating.rating_for = @user2.id
    refute rating.valid?
    refute rating.save
  end

  # success case: should not save rating with null user
  test "should not save rating with null user" do
    rating = Rating.new
    rating.rating = 5
    rating.chatroom = @chatroom
    rating.rating_for = @user2.id
    refute rating.valid?
    refute rating.save
  end

  # success case: should not save rating with null chatroom
  test "should not save rating with null chatroom" do
    rating = Rating.new
    rating.rating = 5
    rating.user = @user
    rating.rating_for = @user2.id
    refute rating.valid?
    refute rating.save
  end

  # success case: should not save rating with null rating for
  test "should not save rating with null rating for" do
    rating = Rating.new
    rating.rating = 5
    rating.user = @user
    rating.chatroom = @chatroom
    refute rating.valid?
    refute rating.save
  end

  # success case: should not save rating with invalid rating for
  test "should not save rating with rating for less than 0" do
    rating = Rating.new
    rating.rating = 5
    rating.user = @user
    rating.chatroom = @chatroom
    rating.rating_for = -1
    refute rating.valid?
    refute rating.save
  end
end
