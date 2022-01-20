require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

  # failure case: should not save activity with no values present
  test "should not save activity with no values present" do
    activity = Activity.new
    refute activity.valid?
  end

  # success case: should save activity with valid parameters
  test "should save valid activity" do
    user = User.new(avatar: '', email: 'user@gamil.com', username: 'username1', first_name: 'user', last_name: 'name', password: 'password123')
    assert user.save

    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = Time.now
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100

    chatroom = Chatroom.new
    chatroom.name = "Activity Title"
    chatroom.activity = activity
    assert chatroom.save
    
    assert activity.save
    
    chatroomuser = ChatroomUser.new
    chatroomuser.user = user
    chatroomuser.chatroom = chatroom
    assert chatroom.save
  end

  # failure case: should not save activity with null title
  test "should not save activity with null title" do
    activity = Activity.new
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = Time.now
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid title
  test "should not save activity with title less than 3 characters" do
    activity = Activity.new
    activity.title = "A"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = Time.now
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid title
  test "should not save activity with a title more than 30 characters" do
    activity = Activity.new
    activity.title = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = Time.now
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with null description
  test "should not save activity with a null description" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = Time.now
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid description
  test "should not save activity with a description more than 500 characters" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vitae mi consequat, maximus magna id, pellentesque nibh. Ut porta urna in augue aliquam, non iaculis eros varius. Praesent sit amet dui sodales ipsum rutrum placerat. Aliquam tempus, velit sit amet mollis tincidunt, orci orci dapibus eros, sed pulvinar felis elit commodo augue. Fusce sodales erat mi, vitae pharetra erat suscipit non. Praesent ac nunc vel justo malesuada rutrum. Nullam vel semper ante. Integer consectetur odio vel quam maximus, ac semper neque volutpat. Quisque maximus justo lorem, eu pulvinar nisi sollicitudin in. Ut placerat metus sit amet leo maximus, nec egestas ipsum bibendum. Ut tincidunt ipsum eget risus condimentum, sit amet maximus nulla facilisis. Mauris lacinia nunc eu ipsum efficitur, eu auctor massa varius. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean urna tellus, facilisis et lobortis a, volutpat vel dui. Aliquam at turpis vel libero id."
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = Time.now
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with null host
  test "should not save activity with null host" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.attendee_max = 5
    activity.start_time = Time.now
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with null attendee max
  test "should not save activity with null attendee max" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.start_time = Time.now
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid atendee max
  test "should not save activity with attendee max less than 1" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 0
    activity.start_time = Time.now
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid attendee max
  test "should not save activity with attendee max greater than 100" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 150
    activity.start_time = Time.now
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with null start time
  test "should not save activity with null start time" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid start time
  test "should not save activity with start time before current time" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now - 1.day)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with null finish time
  test "should not save activity with null finish time" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid finish time
  test "should not save activity with finish before start time" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now - 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with null longitude
  test "should not save activity with null longitude" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid longitude
  test "should not save activity with longitude less than -180" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = -200
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid longitude
  test "should not save activity with longitude greater than 180" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 200
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with null latitude
  test "should not save activity with null latitude" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid latitude
  test "should not save activity with latitude less than -90" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = -100
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end
  
  # failure case: should not save activity with invalid latitude
  test "should not save activity with latitude greater than 90" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 100
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with null icon
  test "should not save activity with null icon" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with null tags
  test "should not save activity with null tags" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with null color
  test "should not save activity with null color" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid color
  test "should not save activity with color with no hash" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid color
  test "should not save activity with color with wrong length" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid color
  test "should not save activity with color with invalid hex" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFGGFG"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with null status
  test "should not save activity with null status" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid status
  test "should not save activity with status less than 0" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = -1
    activity.host_rating = 5
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with null host_rating
  test "should not save activity with null host_rating" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid host_rating
  test "should not save activity with host rating less than 0" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = -1
    activity.cost = 100
    activity.image = ''
    refute activity.valid?
  end

  # failure case: should not save activity with invalid cost
  test "should not save activity with cost less than 0" do
    activity = Activity.new
    activity.title = "Activity Title"
    activity.description = "Activity Description"
    activity.host = "host"
    activity.attendee_max = 5
    activity.start_time = (Time.now)
    activity.finish_time = (Time.now + 1.day)
    activity.longitude = 45
    activity.latitude = 45
    activity.icon = "icon"
    activity.tags = "tags"
    activity.color = "#FFFFFF"
    activity.status = 1
    activity.host_rating = 5
    activity.cost = 0
    activity.image = ''
    refute activity.valid?
  end
end
