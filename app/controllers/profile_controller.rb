class ProfileController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_user

  def index
    @userComment = current_user.comments
    @craft = Craft.all
  end

  def show
    set_user
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

end
