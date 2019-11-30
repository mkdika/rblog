class UsersController < ApplicationController
  layout 'mainadmin'
  before_action :authenticate_user!, :set_paper_trail_whodunnit
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @users = User.order(:id).all
  end

  def show
    @user = current
  end

  def new
    @user = User.new
  end

  def edit
    @user = current
  end

  def destroy
    user = current
    user.destroy
    redirect_to users_path, notice: "User '#{user.show_display_name}' deleted"
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
    @user = current
    if @user.update user_params
      redirect_to user_path @user, notice: "User '#{@user.show_display_name}' has been updated"
    else
      render 'edit'
    end
  end

  def lock
    @user = current
    if @user.locked?
      @user.update locked_at: nil
      status = 'un-locked'
    else
      @user.update locked_at: DateTime.now
      status = 'locked'
    end
    redirect_to user_path @user, notice: "User '#{@user.show_display_name}' has been #{status}"
  end

  def audit_trail
    user = current
    @audit_trail = ApplicationHelper::AuditTrail.to_model user.versions
    render 'shared/audit_trail'
  end

  private

  def current
    @current ||= User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :display_name)
  end

  def record_not_found
    redirect_to users_path, notice: 'User not found'
  end
end