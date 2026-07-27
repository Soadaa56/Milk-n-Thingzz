class CraftsController < ApplicationController
  before_action :set_craft, only: [:show, :edit, :update, :destroy, :move_image]
  before_action :check_if_admin?, except: [:show]

  def index
    @crafts = Craft.includes(:images).order(:id)
  end

  def show
    if @craft.has_variants?
      @variants = @craft.variants.includes(:images)
    end
  end

  def edit ; end

  def new
    @craft = Craft.new
  end

  def create
    # transform the list of uploaded files into a images attributes hash
    if params[:files].present?
      new_images_attributes = params[:files].inject({}) do |hash, file|
        hash.merge!(SecureRandom.hex => { image: file })
      end
    else
      new_images_attributes = {}
    end

    # Merge new image attributes with existing images, if any
    images_attributes = craft_params[:images_attributes].to_h.merge(new_images_attributes)
    craft_attributes = craft_params.merge(images_attributes: images_attributes)

    @craft = Craft.new(craft_attributes)

    # Create Shrine Derivatives
    @craft.images.each do |image|
      image.image_derivatives!
    end

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
    if params[:files].present?
      new_images_attributes = params[:files].inject({}) do |hash, file|
        hash.merge!(SecureRandom.hex => { image: file })
      end
    else
      new_images_attributes = {}
    end

    # Merge new image attributes with existing images, if any
    images_attributes = craft_params[:images_attributes].to_h.merge(new_images_attributes)
    craft_attributes = craft_params.merge(images_attributes: images_attributes)

    # Create Shrine Derivatives
    @craft.images.each do |image|
      image.image_derivatives!
    end

    respond_to do |format|
      if @craft.update(craft_attributes)
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

  def move_image
    @image = @craft.images[params[:old_position].to_i]
    @image.insert_at(params[:new_position].to_i + 1)
    head :ok
  end
  
  private

  def set_craft
    @craft = Craft.find(params[:id])
  end

  def craft_params
    params.require(:craft)
    .permit(
    :name, :category, :subtype, :description, :image,
    :for_sale, :has_variants, :inventory_count, :price, :dimensions,
    images_attributes: [:craft_id, :image, :_destroy])
  end

  def check_if_admin?
    redirect_to root_path unless current_user.admin?
  end
end
