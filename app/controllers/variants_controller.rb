class VariantsController < ApplicationController
  before_action :check_if_admin?, :set_craft
  before_action :set_variant, only: [:edit, :update, :destroy]
  def index
    @variants = @craft.variants.includes(:images)
  end

  def new
    @variant = @craft.variants.new
  end
  
  def edit
  end

  def create
    @variant = @craft.variants.new(variant_params)

    if params[:files].present?
      params[:files].each do |file|
        @variant.images.build(image: file)
      end
    end

    @variant.images.each(&:image_derivatives!)

    if @variant.save
      redirect_to craft_variants_path(@craft), notice: "Variant Added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if params[:files].present?
      params[:files].each do |file|
        @variant.images.build(image: file)
      end
      @variant.images.each(&:image_derivatives!)
    end

    if @variant.update
      redirect_to craft_variants_path(@craft), notice: "Variant Edited"
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @variant.destroy! if current_user&.admin?

    respond_to do |format|
      format.html { redirect_to craft_variants_path(@craft), notice: "Variant Deleted" }
      format.json { head :no_content }
    end
  end

  private 

  def set_craft
    @craft = Craft.find_by!(slug: params[:craft_id])
  end

  def set_variant
    @variant = Variant.find(params[:id])
  end

  def variant_params
    params.require(:variant).permit(
      :name, :sku, :price, :dimensions, :inventory_count, :active,
      images_attributes: [
        :id, :variant_id, :image, :image_data, :_destroy
      ]
    )
  end

  def check_if_admin?
    redirect_to root_path unless current_user&.admin?
  end
end
