require "test_helper"

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "non-admin user should not get index" do
    get admin_orders_url
    assert_response :redirect
  end

  test "non-admin user should not get show" do
    get admin_orders_url(:order)
    assert_response :redirect
  end

  test "admin user should get index" do
    user = users(:admin)
    sign_in user

    get admin_orders_url
    assert_response :success
  end

    test "admin user should get show" do
    user = users(:admin)
    sign_in user

    get admin_orders_url(:order)
    assert_response :success
  end
end
