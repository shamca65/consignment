require 'test_helper'

class SaleSummariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sale_summary = sale_summaries(:one)
  end

  test "should get index" do
    get sale_summaries_url
    assert_response :success
  end

  test "should get new" do
    get new_sale_summary_url
    assert_response :success
  end

  test "should create sale_summary" do
    assert_difference('SaleSummary.count') do
      post sale_summaries_url, params: { sale_summary: { order_no: @sale_summary.order_no, sale_date: @sale_summary.sale_date, sale_total: @sale_summary.sale_total } }
    end

    assert_redirected_to sale_summary_url(SaleSummary.last)
  end

  test "should show sale_summary" do
    get sale_summary_url(@sale_summary)
    assert_response :success
  end

  test "should get edit" do
    get edit_sale_summary_url(@sale_summary)
    assert_response :success
  end

  test "should update sale_summary" do
    patch sale_summary_url(@sale_summary), params: { sale_summary: { order_no: @sale_summary.order_no, sale_date: @sale_summary.sale_date, sale_total: @sale_summary.sale_total } }
    assert_redirected_to sale_summary_url(@sale_summary)
  end

  test "should destroy sale_summary" do
    assert_difference('SaleSummary.count', -1) do
      delete sale_summary_url(@sale_summary)
    end

    assert_redirected_to sale_summaries_url
  end
end
