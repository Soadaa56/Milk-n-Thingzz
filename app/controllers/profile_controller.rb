class ProfileController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_user

  def index
    @userComment = current_user.comments.includes(:rich_text_body)
    @craft = Craft.all
  end

  def show
    set_user
    @comments = @user.comments.includes(:rich_text_body)
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

end
