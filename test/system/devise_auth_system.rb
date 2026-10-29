require "application_system_test_case"

class DeviseAuthSystemTest < ApplicationSystemTestCase
  test "guest can't access admin" do
    visit admin_url
    assert_current_path new_user_session_path
  end

  test "user can't access admin" do
    sign_in users(:one)

    visit admin_url
    assert_current_path root_url
  end

  test "sign in existing user" do
    user = users(:two)
    sign_in user

    visit root_url
    assert_current_path root_path
  end

  test "sign in new user" do
    email = "test@testing.com"
    password = "!ThisIsMyPassword123"
    user = User.create(email: email, password: password)
    visit new_user_registration_url 
    
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_button "Sign up"

    puts user.exists?

    visit new_checkout_path
    assert_current_path new_checkout_path
  end
end