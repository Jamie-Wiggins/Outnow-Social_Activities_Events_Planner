require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # failure case: should not save user with no values present
  test "should not save user with no values present" do
    user = User.new
    refute user.valid?
    refute user.save
  end

  # success case: should save user with valid parameters
  test "should save valid user" do
    user = User.new
    user.email = "steve@outnow.com"
    user.password = "password1234"
    user.username = "steve1"
    user.first_name = "Steve"
    user.last_name = "Elliott"
    user.stripe_id = "id"
    user.card_brand = "visa"
    user.card_exp_month = "01"
    user.card_exp_year = "2025"
    user.card_last4 = "1234"
    assert user.valid?
    assert user.save
  end

  # success case: should not save user with null email
  test "should not save user with null email" do
    user = User.new
    user.password = "password1234"
    user.username = "steve1"
    user.first_name = "Steve"
    user.last_name = "Elliott"
    user.stripe_id = "id"
    user.card_brand = "visa"
    user.card_exp_month = "01"
    user.card_exp_year = "2025"
    user.card_last4 = "1234"
    refute user.valid?
    refute user.save
  end

  # success case: should not save user with invalid email
  test "should not save user with invalid email" do
    user = User.new
    user.email = "steve.outnow.com"
    user.password = "password1234"
    user.username = "steve1"
    user.first_name = "Steve"
    user.last_name = "Elliott"
    user.stripe_id = "id"
    user.card_brand = "visa"
    user.card_exp_month = "01"
    user.card_exp_year = "2025"
    user.card_last4 = "1234"
    refute user.valid?
    refute user.save
  end

  # success case: should not save user with invalid email
  test "should not save user with non unique email" do
    user = User.new
    user.email = "steve@outnow.com"
    user.password = "password1234"
    user.username = "steve1"
    user.first_name = "Steve"
    user.last_name = "Elliott"
    user.stripe_id = "id"
    user.card_brand = "visa"
    user.card_exp_month = "01"
    user.card_exp_year = "2025"
    user.card_last4 = "1234"
    assert user.valid?
    assert user.save

    user2 = User.new
    user2.email = "steve@outnow.com"
    user2.password = "password1234"
    user2.username = "steve2"
    user2.first_name = "Steve"
    user2.last_name = "Elliott"
    user2.stripe_id = "id"
    user2.card_brand = "visa"
    user2.card_exp_month = "01"
    user2.card_exp_year = "2025"
    user2.card_last4 = "1234"
    refute user2.valid?
    refute user2.save
  end

  # success case: should not save user with null password
  test "should not save user with null password" do
    user = User.new
    user.email = "steve@outnow.com"
    user.username = "steve1"
    user.first_name = "Steve"
    user.last_name = "Elliott"
    user.stripe_id = "id"
    user.card_brand = "visa"
    user.card_exp_month = "01"
    user.card_exp_year = "2025"
    user.card_last4 = "1234"
    refute user.valid?
    refute user.save
  end

  # success case: should not save user with invalid password
  test "should not save user with password less than 8 long" do
    user = User.new
    user.email = "steve@outnow.com"
    user.password = ""
    user.username = "steve1"
    user.first_name = "Steve"
    user.last_name = "Elliott"
    user.stripe_id = "id"
    user.card_brand = "visa"
    user.card_exp_month = "01"
    user.card_exp_year = "2025"
    user.card_last4 = "1234"
    refute user.valid?
    refute user.save
  end

  # success case: should not save user with invalid password
  test "should not save user with password more than 30 long" do
    user = User.new
    user.email = "steve@outnow.com"
    user.password = ""
    user.username = "steve1"
    user.first_name = "Steve"
    user.last_name = "Elliott"
    user.stripe_id = "id"
    user.card_brand = "visa"
    user.card_exp_month = "01"
    user.card_exp_year = "2025"
    user.card_last4 = "1234"
    refute user.valid?
    refute user.save
  end

  # success case: should not save user with null username
  test "should not save user with null username" do
    user = User.new
    user.email = "steve@outnow.com"
    user.password = "password1234"
    user.first_name = "Steve"
    user.last_name = "Elliott"
    user.stripe_id = "id"
    user.card_brand = "visa"
    user.card_exp_month = "01"
    user.card_exp_year = "2025"
    user.card_last4 = "1234"
    refute user.valid?
    refute user.save
  end

  # success case: should not save user with invalid username
  test "should not save user with username less than 3 long" do
    user = User.new
    user.email = "steve@outnow.com"
    user.password = "password1234"
    user.username = "a"
    user.first_name = "Steve"
    user.last_name = "Elliott"
    user.stripe_id = "id"
    user.card_brand = "visa"
    user.card_exp_month = "01"
    user.card_exp_year = "2025"
    user.card_last4 = "1234"
    refute user.valid?
    refute user.save
  end

  # success case: should not save user with invalid username
  test "should not save user with username more than 30 long" do
    user = User.new
    user.email = "steve@outnow.com"
    user.password = "password1234"
    user.username = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    user.first_name = "Steve"
    user.last_name = "Elliott"
    user.stripe_id = "id"
    user.card_brand = "visa"
    user.card_exp_month = "01"
    user.card_exp_year = "2025"
    user.card_last4 = "1234"
    refute user.valid?
    refute user.save
  end

  # success case: should not save user with invalid username
  test "should not save user with non unique username" do
    user = User.new
    user.email = "steve@outnow.com"
    user.password = "password1234"
    user.username = "steve_123"
    user.first_name = "Steve"
    user.last_name = "Elliott"
    user.stripe_id = "id"
    user.card_brand = "visa"
    user.card_exp_month = "01"
    user.card_exp_year = "2025"
    user.card_last4 = "1234"
    assert user.valid?
    assert user.save

    user1 = User.new
    user1.email = "steve1@outnow.com"
    user1.password = "password1234"
    user1.username = "steve_123"
    user1.first_name = "Steve"
    user1.last_name = "Elliott"
    user1.stripe_id = "id"
    user1.card_brand = "visa"
    user1.card_exp_month = "01"
    user1.card_exp_year = "2025"
    user1.card_last4 = "1234"
    refute user1.valid?
    refute user1.save
  end

  # success case: should not save user with null first name
  test "should not save user with null first name" do
    user = User.new
    user.email = "steve@outnow.com"
    user.password = "password1234"
    user.username = "steve1"
    user.last_name = "Elliott"
    user.stripe_id = "id"
    user.card_brand = "visa"
    user.card_exp_month = "01"
    user.card_exp_year = "2025"
    user.card_last4 = "1234"
    refute user.valid?
    refute user.save
  end

  # success case: should not save user with null last name
  test "should not save user with null last name" do
    user = User.new
    user.email = "steve@outnow.com"
    user.password = "password1234"
    user.username = "steve1"
    user.first_name = "Steve"
    user.stripe_id = "id"
    user.card_brand = "visa"
    user.card_exp_month = "01"
    user.card_exp_year = "2025"
    user.card_last4 = "1234"
    refute user.valid?
    refute user.save
  end
end
