require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test 'login' do
    get login_path
    assert_template 'sessions/new'

    post login_path,
         params: {
           session: { email: users(:john).email, password: default_password }
         }
    assert_redirected_to manage_path
    assert logged_in?

    get manage_countries_path
    assert_select 'a[href=?]', logout_path

    get manage_networks_path
    assert_select 'a[href=?]', logout_path

    get manage_payg_plans_path
    assert_select 'a[href=?]', logout_path
  end

  test 'login with invalid information' do
    get login_path
    assert_template 'sessions/new'

    post login_path, params: { session: { email: '', password: '' } }
    assert_redirected_to login_path
  end
end
