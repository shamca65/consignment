require "application_system_test_case"

class PickupDatesTest < ApplicationSystemTestCase
  setup do
    @pickup_date = pickup_dates(:one)
  end

  test "visiting the index" do
    visit pickup_dates_url
    assert_selector "h1", text: "Pickup Dates"
  end

  test "creating a Pickup date" do
    visit pickup_dates_url
    click_on "New Pickup Date"

    fill_in "Current pu date", with: @pickup_date.current_pu_date
    click_on "Create Pickup date"

    assert_text "Pickup date was successfully created"
    click_on "Back"
  end

  test "updating a Pickup date" do
    visit pickup_dates_url
    click_on "Edit", match: :first

    fill_in "Current pu date", with: @pickup_date.current_pu_date
    click_on "Update Pickup date"

    assert_text "Pickup date was successfully updated"
    click_on "Back"
  end

  test "destroying a Pickup date" do
    visit pickup_dates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pickup date was successfully destroyed"
  end
end
