class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @user = current_user
    @userComment = @user.comments.includes(:rich_text_body)
    @craft = Craft.all
  end

  def show
    @comments = @user.comments.includes(:rich_text_body)
  end

  def edit
    if current_user == @user
      @bio = @user.bio
    else
      redirect_to root_path, alert: "That isn't your profile"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Profile updated."
    else
      render :edit
    end
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:bio)
  end
end
