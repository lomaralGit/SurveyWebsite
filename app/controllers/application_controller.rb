# frozen_string_literal: true

# The top-most controller. Redirects users to the login if they're not logged in
class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :require_login

  private

  def require_login
    redirect_to login_path unless logged_in?
  end
end
