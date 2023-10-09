class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @users = User.all
  end
  
  def create
    @user = User.new(user_params)
  end

  def update
    
  end

  def console
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation, :role)
  end

  def authorize_admin!
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user.admin?
  end
end
