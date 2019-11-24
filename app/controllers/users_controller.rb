class UsersController < ApplicationController
  layout 'mainadmin'
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @users = User.order(:id).all
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def destroy
    user = current_user
    user.destroy
    redirect_to usrs_path, notice: "User '#{user.show_display_name}' deleted"
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to user_path @user, notice: "User '#{@user.show_display_name}' has been added"
    else
      render 'new'
    end
  end

  def update
    @user = current_user
    if @user.update user_params
      redirect_to user_path @user, notice: "User '#{@user.show_display_name}' has been updated"
    else
      render 'edit'
    end
  end

  private

  def current_user
    @current_user ||= User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :display_name)
  end

  def record_not_found
    redirect_to users_path, notice: 'User not found'
  end
end