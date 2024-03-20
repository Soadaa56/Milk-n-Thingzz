class CraftsController < ApplicationController
  def index
    @crafts = Craft.all
  end

  def show
    set_craft
    set_craft_image
    @comments = @craft.comments.includes(:user, :rich_text_body).order(created_at: :desc)
  end

  def edit
    check_if_admin?
    set_craft
    set_craft_image
  end

  def create
    @craft = Craft.new(craft_params)
  end

  private

  def set_craft
    @craft = Craft.find(params[:id])
  end

  def set_craft_image
    @craftimage = CraftImage.find(params[:id])
  end

  def craft_params
    params.require(:craft).permit(:name, :category, :image)
  end

  def check_if_admin?
    redirect_to root_path unless current_user.admin?
  end
end
