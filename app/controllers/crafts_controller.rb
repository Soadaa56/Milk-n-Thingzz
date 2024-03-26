class CraftsController < ApplicationController
  before_action :set_craft, only: [:show, :edit, :update, :destroy]
  before_action :set_craft_image, only: [:show, :edit]
  before_action :check_if_admin?, only: [:new, :edit, :create, :update, :destroy]

  def index
    @crafts = Craft.all
  end

  def show
    @comments = @craft.comments.includes(:user, :rich_text_body).order(created_at: :desc)
  end

  def edit
  end

  def new
    @craft = Craft.new
  end

  def create
    @craft = Craft.new(craft_params)

    respond_to do |format|
      if @craft.save
        format.html { redirect_to craft_url(@craft), notice: "Craft was successfully posted." }
        format.json { render :show, status: :created, location: @craft }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @craft.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @craft.update(craft_params)
        format.html { redirect_to craft_url(@craft), notice: "Craft was successfully updated." }
        format.json { render :show, status: :ok, location: @craft }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @craft.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @craft.destroy! if current_user.admin?

    respond_to do |format|
      format.html { redirect_to crafts_path, notice: "Craft was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_craft
    @craft = Craft.find(params[:craft_id] || params[:id])
  end

  def set_craft_image
    @craftimage = CraftImage.find_by(params[:id])
  end

  def craft_params
    params.require(:craft).permit(:name, :category, :image)
  end

  def check_if_admin?
    redirect_to root_path unless current_user.admin?
  end
end
