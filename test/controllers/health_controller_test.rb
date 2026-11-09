require "test_helper"

class HealthControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get rails_health_check_url
    assert_response :success
  end
end
