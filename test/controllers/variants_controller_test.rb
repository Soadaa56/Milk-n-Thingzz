require "test_helper"

class VariantsControllerTest < ActionDispatch::IntegrationTest
  test "Non-admin should get redirected" do
    get variants_url
    assert_response :redirect
  end

  test "should get show" do
    get variants_url
    assert_response :success
  end

  test "should get new" do
    get variants_url
    assert_response :success
  end

  test "should get create" do
    get variants_url
    assert_response :success
  end

  test "should get update" do
    get variants_url
    assert_response :success
  end

  test "should get destroy" do
    get variants_url
    assert_response :success
  end
end
