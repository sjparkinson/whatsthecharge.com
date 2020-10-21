require 'test_helper'

class UsersLogoutTest < ActionDispatch::IntegrationTest
  test "logout with a session" do
    login_as users(:john)
    assert logged_in?

    delete logout_path
    assert_redirected_to root_path
    assert_not logged_in?
  end

  test "logout without a session" do
    delete logout_path
    assert_redirected_to root_path
    assert_not logged_in?
  end
end
