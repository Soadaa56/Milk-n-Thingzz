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
    craft_images_attributes = craft_variant_params[:craft_images_attributes].to_h

    craft_attributes = craft_variant_params.merge(craft_images_attributes: craft_images_attributes, craft_id: @craft.id)    
    
    @craft_variant = CraftVariant.new(craft_attributes)
    if @craft_variant.save
      redirect_to edit_craft_path(@craft), notice: "Variant created"
    else
      render :new, status: :unprocessable_entity, notice: "Error"
    end
  end

  def update
    if @craft_variant.update(craft_variant_params)
      redirect_to edit_craft_path(@craft), notice: "Variant updated"
    else
      render :edit, status: :unprocessable_entity, notice: "Error"
    end
  end

  def destroy
    @craft_variant.destroy
    redirect_to craft_craft_variants_path(@craft.id), notice: "Craft variant deleted"
  end

  private 

  def set_craft
    @craft = Craft.find(params[:craft_id])
  end

  def set_craft_variant
    @craft_variant = CraftVariant.find(params[:id])
  end

  def craft_variant_params
    params.require(:craft_variant)
    .permit(:craft_id, :name, :price, :inventory_count, :dimensions,
            craft_images_attributes: [:craft_id, :image, :_destroy])
  end

  def check_if_admin?
    redirect_to root_path unless current_user.admin?
  end
end
