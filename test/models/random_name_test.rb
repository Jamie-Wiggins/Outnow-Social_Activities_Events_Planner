require 'test_helper'

class RandomNameTest < ActiveSupport::TestCase
  # failure case: should not save random_name with no values present
  test "should not save random_name with no values present" do
    random_name = RandomName.new
    refute random_name.valid?
    refute random_name.save
  end

  # success case: should save random_name with valid parameters
  test "should save valid random_name" do
    random_name = RandomName.new
    random_name.username = "username"
    assert random_name.valid?
    assert random_name.save
  end

  # failure case: should not save random_name with null username
  test "should not save random_name with null username" do
    random_name = RandomName.new
    refute random_name.valid?
    refute random_name.save
  end

  # failure case: should not save random_name with invalid username
  test "should not save random_name with username less than 3 long" do
    random_name = RandomName.new
    random_name.username = "a"
    refute random_name.valid?
    refute random_name.save
  end

  # failure case: should not save random_name with invalid username
  test "should not save random_name with username more than 30 long" do
    random_name = RandomName.new
    random_name.username = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    refute random_name.valid?
    refute random_name.save
  end
end
