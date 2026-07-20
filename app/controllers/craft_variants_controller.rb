class CraftVariantsController < ApplicationController
  before_action :set_craft
  before_action :set_craft_variant, only: [:edit, :update, :destroy]
  before_action :check_if_admin?

  def index
    @craft_variant = @craft.craft_variants.order(created_at: :desc)
  end

  def edit ; end

  def new
    @craft_variant = CraftVariant.new
  end

  def create
    @craft_variant = CraftVariant.new(craft_variant_params)
    if @craft_variant.save
      redirect_to @craft, notice: "Variant created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @craft_variant.update(craft_variant_params)
      redirect_to @craft, notice: "Variant updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @craft_variant.destroy
    redirect_to @craft, notice: "Craft variant deleted"
  end

  private 

  def set_craft
    @craft = Craft.find_by!(params[:craft_id])
  end

  def set_craft_variant
    @craft_variant = @craft.craft_variants.find(params[:id])
  end

  def craft_variant_params
    params.require(:craft_variant)
    .permit(:name, :price, :inventory_count, :dimensions, :image,
            craft_images_attributes: [:id, :image, :_destroy])
  end

  def check_if_admin?
    redirect_to root_path unless current_user.admin?
  end
end
