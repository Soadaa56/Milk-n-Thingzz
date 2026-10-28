require "test_helper"

class CraftsControllerTest < ActionDispatch::IntegrationTest
  test "non-user should get redirect to root" do
    get crafts_url
    assert_response :redirect
    assert_redirected_to root_url
  end

  test "non-admin user should get redirect from index" do
    user = users(:one)
    sign_in user
    
    get crafts_url
    assert_response :redirect
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
