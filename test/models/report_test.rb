require 'test_helper'

class ReportTest < ActiveSupport::TestCase

  setup do
    @activity = Activity.new(title: "Activity Title", description: "Activity Description", host: "host", attendee_max: 5, start_time: DateTime.now ,finish_time: (Time.now + 1.day),
        longitude: 45,latitude: 45,icon: "icon",tags: "tags",color: "#FFFFFF",status: 1,host_rating: 5,image: '')

    @chatroom = Chatroom.new(name: @activity.title, activity: @activity)
  end

  # failure case: should not save report with no values present
  test "should not save report with no values present" do
    report = Report.new
    refute report.valid?
    refute report.save
  end

  # success case: should save report with valid parameters
  test "should save valid report" do
    report = Report.new
    report.title = "Report Title"
    report.content = "Report Content"
    report.username = "username"
    report.chatroom = @chatroom
    assert report.valid?
    assert report.save
  end

  # success case: should not save report with null title
  test "should not save report with null title" do
    report = Report.new
    report.content = "Report Content"
    report.username = "username"
    report.chatroom = @chatroom
    refute report.valid?
    refute report.save
  end

  # success case: should not save report with invalid title
  test "should not save report with title less than 3" do
    report = Report.new
    report.title = "a"
    report.content = "Report Content"
    report.username = "username"
    report.chatroom = @chatroom
    refute report.valid?
    refute report.save
  end

  # success case: should not save report with invalid title
  test "should not save report with title greater than 30" do
    report = Report.new
    report.title = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    report.content = "Report Content"
    report.username = "username"
    report.chatroom = @chatroom
    refute report.valid?
    refute report.save
  end

  # success case: should not save report with null content
  test "should not save report with null content" do
    report = Report.new
    report.title = "Report Title"
    report.username = "username"
    report.chatroom = @chatroom
    refute report.valid?
    refute report.save
  end

  # success case: should not save report with null username
  test "should not save report with null username" do
    report = Report.new
    report.title = "Report Title"
    report.content = "Report Content"
    report.chatroom = @chatroom
    refute report.valid?
    refute report.save
  end

  # success case: should not save report with null chatroom
  test "should not save report with null chatroom" do
    report = Report.new
    report.title = "Report Title"
    report.content = "Report Content"
    report.username = "username"
    refute report.valid?
    refute report.save
  end
end
