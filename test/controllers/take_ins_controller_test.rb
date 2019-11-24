require 'test_helper'

class TakeInsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @take_in = take_ins(:one)
  end

  test "should get index" do
    get take_ins_url
    assert_response :success
  end

  test "should get new" do
    get new_take_in_url
    assert_response :success
  end

  test "should create take_in" do
    assert_difference('TakeIn.count') do
      post take_ins_url, params: { take_in: { customer_id: @take_in.customer_id, item_id: @take_in.item_id } }
    end

    assert_redirected_to take_in_url(TakeIn.last)
  end

  test "should show take_in" do
    get take_in_url(@take_in)
    assert_response :success
  end

  test "should get edit" do
    get edit_take_in_url(@take_in)
    assert_response :success
  end

  test "should update take_in" do
    patch take_in_url(@take_in), params: { take_in: { customer_id: @take_in.customer_id, item_id: @take_in.item_id } }
    assert_redirected_to take_in_url(@take_in)
  end

  test "should destroy take_in" do
    assert_difference('TakeIn.count', -1) do
      delete take_in_url(@take_in)
    end

    assert_redirected_to take_ins_url
  end
end
