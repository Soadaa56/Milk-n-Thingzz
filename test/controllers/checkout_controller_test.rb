require "test_helper"

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "user should get checkout" do
    user = users(:one)
    sign_in user

    get checkout_url
    assert_response :success
  end

  test "non-user should redirect to sign up" do
    # code
  end
end
