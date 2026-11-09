require "test_helper"

class CraftsControllerTest < ActionDispatch::IntegrationTest
  test "non-user should get redirect to root" do
    get crafts_url
    assert_response :redirect
    assert_redirected_to root_url
  end

  test "non-admin user should get redirect from index" do
    sign_in users(:one)
    
    get crafts_url
    assert_response :redirect
  end

  test "admin should get index" do
    sign_in users(:admin)

    get crafts_url
    assert_response :success
  end

  test "should get show" do
    @craft = crafts(:one).slug

    get craft_url(@craft)
    assert_response :success
  end

  test "non-admin should get redirected from new" do
    sign_in users(:one)

    get new_craft_url
    assert_response :redirect
  end

  test "admin should get new" do
    sign_in users(:admin)

    get new_craft_url
    assert_response :success
  end
end
