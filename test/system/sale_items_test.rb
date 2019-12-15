require "application_system_test_case"

class SaleItemsTest < ApplicationSystemTestCase
  setup do
    @sale_item = sale_items(:one)
  end

  test "visiting the index" do
    visit sale_items_url
    assert_selector "h1", text: "Sale Items"
  end

  test "creating a Sale item" do
    visit sale_items_url
    click_on "New Sale Item"

    fill_in "Price", with: @sale_item.price
    click_on "Create Sale item"

    assert_text "Sale item was successfully created"
    click_on "Back"
  end

  test "updating a Sale item" do
    visit sale_items_url
    click_on "Edit", match: :first

    fill_in "Price", with: @sale_item.price
    click_on "Update Sale item"

    assert_text "Sale item was successfully updated"
    click_on "Back"
  end

  test "destroying a Sale item" do
    visit sale_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sale item was successfully destroyed"
  end
end
