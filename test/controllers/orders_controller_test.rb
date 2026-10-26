require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get show" do
    get orders_url(:order)
    assert_response :success
  end
end
