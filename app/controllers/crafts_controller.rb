class CraftsController < ApplicationController
  def index
    @crafts = Craft.all
  end

  def show
    @craft = Craft.find(params[:id])
    @craftimage = CraftImage.find(params[:id])
    @comments = @craft.comments.includes(:user, :rich_text_body).order(created_at: :desc)
  end

  def edit
    @craft = Craft.find(params[:id])
  end

  def create
    @craft = Craft.new(craft_params)
  end

  private

  def craft_params
    params.require(:craft).permit(:name, :category, :image)
  end
end
