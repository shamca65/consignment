require 'test_helper'

class PickupDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pickup_date = pickup_dates(:one)
  end

  test "should get index" do
    get pickup_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_pickup_date_url
    assert_response :success
  end

  test "should create pickup_date" do
    assert_difference('PickupDate.count') do
      post pickup_dates_url, params: { pickup_date: { current_pu_date: @pickup_date.current_pu_date } }
    end

    assert_redirected_to pickup_date_url(PickupDate.last)
  end

  test "should show pickup_date" do
    get pickup_date_url(@pickup_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_pickup_date_url(@pickup_date)
    assert_response :success
  end

  test "should update pickup_date" do
    patch pickup_date_url(@pickup_date), params: { pickup_date: { current_pu_date: @pickup_date.current_pu_date } }
    assert_redirected_to pickup_date_url(@pickup_date)
  end

  test "should destroy pickup_date" do
    assert_difference('PickupDate.count', -1) do
      delete pickup_date_url(@pickup_date)
    end

    assert_redirected_to pickup_dates_url
  end
end
