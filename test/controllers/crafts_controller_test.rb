require "test_helper"

class CraftsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crafts_index_url
    assert_response :success
  end

  test "should get show" do
    get crafts_show_url
    assert_response :success
  end
end
