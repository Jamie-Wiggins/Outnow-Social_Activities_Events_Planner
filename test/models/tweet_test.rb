require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  setup do
    @user = User.new(avatar: '', email: 'user@gamil.com', username: 'username1', first_name: 'user', last_name: 'name', password: 'password123')
    assert @user.valid?
    assert @user.save
  end

  # failure case: should not save tweet with no values present
  test "should not save tweet with no values present" do
    tweet = Tweet.new
    refute tweet.valid?
    refute tweet.save
  end

  # success case: should save tweet with valid parameters
  test "should save valid tweet" do
    tweet = Tweet.new
    tweet.data = "data"
    tweet.user = @user
    tweet.twitter_user = 1
    assert tweet.valid?
    assert tweet.save
  end

  # success case: should not save tweet with null data
  test "should not save tweet with null data" do
    tweet = Tweet.new
    tweet.user = @user
    tweet.twitter_user = 1
    refute tweet.valid?
    refute tweet.save
  end

  # success case: should not save tweet with null user
  test "should not save tweet with null user" do
    tweet = Tweet.new
    tweet.data = "data"
    tweet.twitter_user = 1
    refute tweet.valid?
    refute tweet.save
  end

  # success case: should not save tweet with null twitter user
  test "should not save tweet with null twitter user" do
    tweet = Tweet.new
    tweet.data = "data"
    tweet.user = @user
    refute tweet.valid?
    refute tweet.save
  end

  # success case: should not save tweet with invalid twitter user
  test "should not save tweet with twitter user less than 0" do
    tweet = Tweet.new
    tweet.data = "data"
    tweet.user = @user
    tweet.twitter_user = -1
    refute tweet.valid?
    refute tweet.save
  end
end
