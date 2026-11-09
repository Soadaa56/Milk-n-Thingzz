require "test_helper"

class CheckoutsControllerTest < ActionDispatch::IntegrationTest
  test "user should get checkout" do
    sign_in users(:one)

    get new_checkout_url
    assert_response :success
  end

  test "non-user should redirect to sign up" do
    get new_checkout_url
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
end
