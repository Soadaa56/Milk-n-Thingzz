require "test_helper"

class CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cart_items_url
    assert_response :success
  end

  test "should get destroy" do
    get cart_items_url
    assert_response :success
  end
end
