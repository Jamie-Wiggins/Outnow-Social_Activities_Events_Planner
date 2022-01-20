require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  # failure case: should not save admin user with no values present
  test "should not save admin user with no values present" do
    admin_user = AdminUser.new
    refute admin_user.valid?
    refute admin_user.save
  end

  # success case: should save admin user with valid parameters
  test "should save valid admin user" do
    admin_user = AdminUser.new
    admin_user.email = "admin@outnow.com"
    admin_user.password = "password1234"
    assert admin_user.valid?
    assert admin_user.save
  end

  # success case: should not save admin user with null email
  test "should not save adnmin user with invalid email" do
    admin_user = AdminUser.new
    admin_user.password = "password1234"
    refute admin_user.valid?
    refute admin_user.save
  end

  # success case: should not save admin user with null password
  test "should not save adnmin user with null password" do
    admin_user = AdminUser.new
    admin_user.email = "admin@outnow.com"
    refute admin_user.valid?
    refute admin_user.save
  end

  # success case: should not save admin user with invalid password
  test "should not save adnmin user with password shorter than 3" do
    admin_user = AdminUser.new
    admin_user.email = "admin@outnow.com"
    admin_user.password = "a"
    refute admin_user.valid?
    refute admin_user.save
  end
end
