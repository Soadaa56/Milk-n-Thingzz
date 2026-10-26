require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_url
    assert_response :success
  end

  test "should get earring" do
    get home_earring_url
    assert_response :success
  end

  test "should get store" do
    get home_store_url
    assert_response :success
  end
end
