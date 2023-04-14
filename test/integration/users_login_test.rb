# frozen_string_literal: true

require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # A login with a valid email but an invalid password fails and flashes an alert
  test 'login with valid email/invalid password' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: 'giles.25@osu.edu',
                                          password: 'invalid' } }
    assert_not logged_in_test?
    assert_response :unprocessable_entity
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  # A valid login works, and the logout is successful
  test 'login with valid information followed by logout' do
    post login_path, params: { session: { email: 'giles.25@osu.edu',
                                          password: '123' } }
    assert logged_in_test?
    assert_redirected_to presentations_path
    follow_redirect!
    assert_template 'presentations/index'
    assert_select 'a[href=?]', login_path, count: 0
    assert_select 'a[href=?]', logout_path
    delete logout_path
    assert_not logged_in_test?
    assert_response :see_other
    assert_redirected_to login_path
    follow_redirect!
    assert_select 'a[href=?]', login_path
    assert_select 'a[href=?]', logout_path, count: 0
  end
end
