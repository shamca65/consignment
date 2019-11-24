require "application_system_test_case"

class TakeInsTest < ApplicationSystemTestCase
  setup do
    @take_in = take_ins(:one)
  end

  test "visiting the index" do
    visit take_ins_url
    assert_selector "h1", text: "Take Ins"
  end

  test "creating a Take in" do
    visit take_ins_url
    click_on "New Take In"

    fill_in "Customer", with: @take_in.customer_id
    fill_in "Item", with: @take_in.item_id
    click_on "Create Take in"

    assert_text "Take in was successfully created"
    click_on "Back"
  end

  test "updating a Take in" do
    visit take_ins_url
    click_on "Edit", match: :first

    fill_in "Customer", with: @take_in.customer_id
    fill_in "Item", with: @take_in.item_id
    click_on "Update Take in"

    assert_text "Take in was successfully updated"
    click_on "Back"
  end

  test "destroying a Take in" do
    visit take_ins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Take in was successfully destroyed"
  end
end
