class AdminController < ApplicationController
  before_action :authorize_admin!

  def index
    @users = User.all
  end

  private

  def authorize_admin!
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user.admin?
  end
end
