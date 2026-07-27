class VariantsController < ApplicationController
  before_action :set_craft
  before_action :set_variant, only: [:edit, :update, :destroy]
  before_action :check_if_admin?

  def index
    @variant = @craft.variants.includes(:images).order(created_at: :desc)
  end

  def edit ; end

  def new
    @variant = Variant.new
  end

  def create
    if params[:files].present?
      new_images_attributes = params[:files].inject({}) do |hash, file|
        hash.merge!(SecureRandom.hex => { image: file })
      end
    else
      new_images_attributes = {}
    end

    images_attributes = variant_params[:images_attributes].to_h.merge(new_images_attributes)
    craft_attributes = variant_params.merge(
      images_attributes: images_attributes,
      craft_id: @craft.id
    )

    @variant = Variant.new(craft_attributes)

    @variant.images.each do |image|
      image.image_derivatives!
    end

    if @variant.save
      redirect_to craft_variants_path(@craft), notice: "Variant created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if params[:files].present?
      new_images_attributes = params[:files].inject({}) do |hash, file|
        hash.merge!(SecureRandom.hex => { image: file })
      end
    else
      new_images_attributes = {}
    end

    images_attributes = variant_params[:images_attributes].to_h.merge(new_images_attributes)
    craft_attributes = variant_params.merge(images_attributes: images_attributes)

    @variant.images.each do |image|
      image.image_derivatives!
    end

    if @variant.update(craft_attributes)
      redirect_to craft_variants_path(@craft), notice: "Variant updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @variant.destroy
    redirect_to craft_variants_path(@craft), notice: "Craft variant deleted"
  end

  private 

  def set_craft
    @craft = Craft.find(params[:craft_id])
  end

  def set_variant
    @variant = Variant.find(params[:id])
  end

  def variant_params
    params.require(:variant)
    .permit(:craft_id, :name, :price, :inventory_count, :dimensions, :image,
            images_attributes: [:craft_id, :image, :_destroy])
  end

  def check_if_admin?
    redirect_to root_path unless current_user.admin?
  end
end
