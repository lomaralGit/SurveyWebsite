# frozen_string_literal: true

require 'test_helper'

class PresentationsControllerTest < ActionDispatch::IntegrationTest
  # After logging in, presentation index can be accessed
  test 'should get presentations index' do
    post login_path, params: { session: { email: 'giles.25@osu.edu', password: '123' } }
    get presentations_path
    assert_response :success
  end

  # Presentation index cannot be accessed without logging in
  test 'should redirect to login from index' do
    get presentations_path
    assert_response :found
  end

  # After logging in, an individual presentation can be accessed
  test 'should get presentations show' do
    post login_path, params: { session: { email: 'giles.25@osu.edu', password: '123' } }
    presentation = presentations(:one)
    get "/presentations/#{presentation.id}"
    assert_response :success
  end

  # An individual presentation cannot be accessed without logging in
  test 'should redirect to login from show' do
    presentation = presentations(:one)
    get "/presentations/#{presentation.id}"
    assert_response :found
  end
end
