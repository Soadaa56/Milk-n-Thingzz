require "test_helper"

class CraftsControllerTest < ActionDispatch::IntegrationTest
  test "non-admin should get redirect from index" do
    user = users(:one)
    sign_in user
    
    get crafts_url
    assert_response :success
  end
  test "admin should get index" do
    user = users(:admin)
    sign_in user

    get crafts_url
    assert_response :success
  end

  test "should get show" do
    get crafts_url(:craft)
    assert_response :success
  end

  test "non-admin should get redirected from new" do
    user = users(:one)
    sign_in user

    get new_crafts_url
    assert_response :redirect
  end

  test "admin should get new" do
    user = users(:admin)
    sign_in user

    get new_crafts_url
    assert_response :success
  end
end
