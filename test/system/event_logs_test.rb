require "application_system_test_case"

class EventLogsTest < ApplicationSystemTestCase
  setup do
    @event_log = event_logs(:one)
  end

  test "visiting the index" do
    visit event_logs_url
    assert_selector "h1", text: "Event Logs"
  end

  test "creating a Event log" do
    visit event_logs_url
    click_on "New Event Log"

    fill_in "Event Description", with: @event_log.event_description
    fill_in "Event", with: @event_log.event_id
    fill_in "Integer,", with: @event_log.integer,
    fill_in "String", with: @event_log.string
    click_on "Create Event log"

    assert_text "Event log was successfully created"
    click_on "Back"
  end

  test "updating a Event log" do
    visit event_logs_url
    click_on "Edit", match: :first

    fill_in "Event Description", with: @event_log.event_description
    fill_in "Event", with: @event_log.event_id
    fill_in "Integer,", with: @event_log.integer,
    fill_in "String", with: @event_log.string
    click_on "Update Event log"

    assert_text "Event log was successfully updated"
    click_on "Back"
  end

  test "destroying a Event log" do
    visit event_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event log was successfully destroyed"
  end
end
