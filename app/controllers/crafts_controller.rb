class CraftsController < ApplicationController
  before_action :set_craft, only: [:show, :edit]
  before_action :set_craft_image, only: [:show, :edit]

  def index
    @crafts = Craft.all
  end

  def show
    @comments = @craft.comments.includes(:user, :rich_text_body).order(created_at: :desc)
  end

  def edit
    check_if_admin?
  end

  def new
    @craft = Craft.new
  end

  def create
    @craft = Craft.new(craft_params)
    if @craft.save
      redirect_to @craft
    else
      render :new
    end
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
