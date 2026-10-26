require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "non user should not get index" do
    get admin_url
    assert_response :redirect
  end

  test "non-admin user should not get index" do
    user = users(:one)
    sign_in user
    
    get admin_url
    assert_response :redirect
  end

  test "admin user should get index" do
    user = users(:admin)
    sign_in user

    get admin_url
    assert_response :success
  end
end
