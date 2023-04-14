# frozen_string_literal: true

# Controller that handles users. Ensures that only instructors can view the users page
class UsersController < ApplicationController
  before_action :permission?

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:email, :privileged, :name, :username, :password, :is_active))
      flash[:success] = 'User successfully updated!'
      redirect_to user_url(@user)
    else
      flash.now[:danger] = 'User update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :privileged, :name, :username, :password, :is_active)
  end

  def permission?
    return if current_user.privileged == true

    redirect_to presentations_path
    flash[:warning] = 'Only instructors can view this page'
  end
end
