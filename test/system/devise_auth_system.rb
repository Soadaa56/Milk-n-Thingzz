require "application_system_test_case"

class DeviseAuthSystemTest < ApplicationSystemTestCase
  test "admin page not for non-admin users" do
    visit admin_url
  end

  test "sign in existing user" do
    user = users(:two)
    sign_in user

    visit root_url
  end
end