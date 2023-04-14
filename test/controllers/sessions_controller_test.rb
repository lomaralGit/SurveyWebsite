# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  # The login path takes the user to the form
  test 'should get new' do
    get login_path
    assert_response :success
  end
end
