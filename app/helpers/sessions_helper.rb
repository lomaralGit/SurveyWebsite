# frozen_string_literal: true

# Has helper functions for logins/logouts
module SessionsHelper
  # Logins in as the provided user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Indicates whether or not a user is logged in
  def logged_in?
    !current_user.nil?
  end

  # Indicates whether or not a user has special privileges
  def privileged?
    current_user.privileged
  end

  # Logs out the current user
  def log_out
    reset_session
    @current_user = nil
  end
end
