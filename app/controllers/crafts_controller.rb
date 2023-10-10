class CraftsController < ApplicationController
  def index
    @crafts = Craft.all
  end

  def show
    @craft = set_craft
    @craftimage = set_craft_image
    @comments = @craft.comments.includes(:user, :rich_text_body).order(created_at: :desc)
  end

  def edit
    @craft = set_craft
    @craftimage = set_craft_image
  end

  def create
    @craft = Craft.new(craft_params)
  end

  private

  def set_craft
    Craft.find(params[:id])
  end

  def set_craft_image
    CraftImage.find(params[:id])
  end

  def craft_params
    params.require(:craft).permit(:name, :category, :image)
  end
end
