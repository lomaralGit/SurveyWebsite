# frozen_string_literal: true

# Controller that handles logins and logouts
class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    redirect_to presentations_path if logged_in?
  end

  # Disabled because of the complexity of this action
  # rubocop:disable Metrics/AbcSize
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && !user.is_active
      flash.now[:danger] = 'Inactive account'
      render 'new', status: :unprocessable_entity
    elsif user&.authenticate(params[:session][:password])
      handle_login user
    else
      flash.now[:danger] = 'Invalid email/password'
      render 'new', status: :unprocessable_entity
    end
  end
  # rubocop:enable Metrics/AbcSize

  def destroy
    log_out
    redirect_to login_path, status: :see_other
  end

  private

  def handle_login(user)
    reset_session
    log_in user
    redirect_to presentations_path
  end
end
