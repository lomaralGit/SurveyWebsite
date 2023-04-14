# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # After logging in, user index can be accessed
  test 'should get users index' do
    post login_path, params: { session: { email: 'giles.25@osu.edu', password: '123' } }
    get users_path
    assert_select 'title', 'Users'
    assert_response :success
  end

  # User index cannot be accessed without logging in
  test 'should redirect to login from index' do
    get users_path
    assert_response :found
  end

  # After logging in, an individual user can be accessed
  test 'should get users show' do
    post login_path, params: { session: { email: 'giles.25@osu.edu', password: '123' } }
    user_id = users.first.id.to_s
    get "/users/#{user_id}"
    assert_select 'title', 'Users'
    assert_response :success
  end

  # An individual user cannot be accessed without logging in
  test 'should redirect to login from show' do
    user_id = users.first.id.to_s
    get "/users/#{user_id}"
    assert_response :found
  end

  # After logging in, an individual user can be edited
  test 'should get users edit' do
    post login_path, params: { session: { email: 'giles.25@osu.edu', password: '123' } }
    user_id = users.first.id.to_s
    get "/users/#{user_id}/edit"
    assert_select 'title', 'Users'
    assert_response :success
  end

  # An individual user cannot be edited without logging in
  test 'should redirect to login from edit' do
    user_id = users.first.id.to_s
    get "/users/#{user_id}/edit"
    assert_response :found
  end

  # After logging in, a new user can be created
  test 'should get users create' do
    post login_path, params: { session: { email: 'giles.25@osu.edu', password: '123' } }
    get '/users/new'
    assert_select 'title', 'Users'
    assert_response :success
  end

  # A new user cannot be created without logging in
  test 'should redirect to login from create' do
    get '/users/new'
    assert_response :found
  end

  # Logging in with a student and going to the users index redirects to presentations
  test 'should redirect to presentations from index' do
    post login_path, params: { session: { email: 'doe.1@osu.edu', password: '123' } }
    get users_path
    assert_response :found
  end

  # Logging in with a student and going to the users show page redirects to presentations
  test 'should redirect to presentations from show' do
    post login_path, params: { session: { email: 'doe.1@osu.edu', password: '123' } }
    user_id = users.first.id.to_s
    get "/users/#{user_id}"
    assert_response :found
  end

  # Logging in with a student and going to the users edit page redirects to presentations
  test 'should redirect to presentations from edit' do
    post login_path, params: { session: { email: 'doe.1@osu.edu', password: '123' } }
    user_id = users.first.id.to_s
    get "/users/#{user_id}/edit"
    assert_response :found
  end
end
