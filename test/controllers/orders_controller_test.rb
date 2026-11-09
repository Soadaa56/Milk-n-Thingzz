require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "non-user should get redirected to sign up" do
    get orders_url
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "user should get show" do
    sign_in users(:one)
    get orders_url(orders(:one))
    assert_response :success
  end
end
