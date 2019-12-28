require "application_system_test_case"

class SaleSummariesTest < ApplicationSystemTestCase
  setup do
    @sale_summary = sale_summaries(:one)
  end

  test "visiting the index" do
    visit sale_summaries_url
    assert_selector "h1", text: "Sale Summaries"
  end

  test "creating a Sale summary" do
    visit sale_summaries_url
    click_on "New Sale Summary"

    fill_in "Order no", with: @sale_summary.order_no
    fill_in "Sale date", with: @sale_summary.sale_date
    fill_in "Sale total", with: @sale_summary.sale_total
    click_on "Create Sale summary"

    assert_text "Sale summary was successfully created"
    click_on "Back"
  end

  test "updating a Sale summary" do
    visit sale_summaries_url
    click_on "Edit", match: :first

    fill_in "Order no", with: @sale_summary.order_no
    fill_in "Sale date", with: @sale_summary.sale_date
    fill_in "Sale total", with: @sale_summary.sale_total
    click_on "Update Sale summary"

    assert_text "Sale summary was successfully updated"
    click_on "Back"
  end

  test "destroying a Sale summary" do
    visit sale_summaries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sale summary was successfully destroyed"
  end
end
