class CraftsController < ApplicationController
  before_action :set_craft, only: [:edit, :update, :destroy, :move_image]
  before_action :check_if_admin?, except: [:show]

  def index
    @crafts = Craft.includes(:images).order(:id)
  end

  def show
    @craft = Craft.includes(variants: :images).find_by!(slug: params[:id])
  end

  def edit ; end

  def new
    @craft = Craft.new
  end

  def create
    @craft = Craft.new(craft_params)

    variant = @craft.variants.build(
      name: "default",
      price: @craft.default_price,
      dimensions: @craft.default_dimensions,
      stock: params[:stock]
    )

    if params[:files].present?
      params[:files].each do |file|
        variant.images.build(image: file)
      end
    end

    # should only be one variant
    @craft.variants.each do |v|
      v.images.each(&:image_derivatives!)
    end

    if @craft.save
      redirect_to craft_url(@craft.slug), notice: "Craft posted"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    default_variant = @craft.variants.first

    if params[:files].present?
      params[:files].each do |file|
        default_variant.images.build(image: file)
      end
      default_variant.images.each(&:image_derivatives!)
    end

    default_variant.update(
      price: params[:default_price],
      dimensions: params[:default_dim],
      stock: params[:stock]
    )

    respond_to do |format|
      if @craft.update(craft_params) && default_variant.update(
          price: params[:default_price],
          dimensions: params[:default_dimensions],
          stock: params[:stock]
      )
        format.html { redirect_to craft_url(@craft.slug), notice: "Craft updated" }
        format.json { render :show, status: :ok, location: @craft }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @craft.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @craft.destroy! if current_user&.admin?

    respond_to do |format|
      format.html { redirect_to crafts_path, notice: "Craft was successfully destroyed" }
      format.json { head :no_content }
    end
  end

  def move_image
    @image = @craft.images[params[:old_position].to_i]
    @image.insert_at(params[:new_position].to_i + 1)
    head :ok
  end
  
  private

  def set_craft
    @craft = Craft.includes(variants: :images).find(params[:id])
  end

  def craft_params
    params.require(:craft).permit(
      :name, :description, :category, :subtype, :for_sale,
      :default_price, :default_dimensions,
      variants_attributes: [
        :id, :name, :sku, :price, :dimensions, :stock, :active, :_destroy,
        images_attributes: [:id, :variant_id, :image, :image_data, :_destroy]
      ]
    )
  end

  def check_if_admin?
    redirect_to root_path unless current_user&.admin?
  end
end
