require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
    test "create an activity" do
        sign_in users(:userJamie)
        visit root_url
        click_on "Create Activity"
        fill_in "Title", with: "Test Activity"
        fill_in "Description", with: "Test Activity"
        fill_in "Attendee max", with: 12
        fill_in "activity_icon", with: "Football"
        fill_in "Category", with: "Sport"
        fill_in "Tags", with: "Test Activity"
        fill_in "Start Time", with: DateTime.now
        fill_in "End Time", with: DateTime.now + 1.day

        click_on "Create Activity"
    end

end