class CraftsController < ApplicationController
  before_action :set_craft, only: [:show, :edit, :update, :destroy, :move_image]
  before_action :check_if_admin?, only: [:new, :edit, :create, :update, :destroy]

  def index
    @crafts = Craft.includes(:craft_images).order(:id)
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
    # transform the list of uploaded files into a craft_images attributes hash
    if params[:files].present?
      new_craft_images_attributes = params[:files].inject({}) do |hash, file|
        hash.merge!(SecureRandom.hex => { image: file })
      end
    else
      new_craft_images_attributes = {}
    end

    # Merge new image attributes with existing images, if any
    craft_images_attributes = craft_params[:craft_images_attributes].to_h.merge(new_craft_images_attributes)
    craft_attributes = craft_params.merge(craft_images_attributes: craft_images_attributes)

    @craft = Craft.new(craft_attributes)

    # Create Shrine Derivatives
    @craft.craft_images.each do |image|
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
      new_craft_images_attributes = params[:files].inject({}) do |hash, file|
        hash.merge!(SecureRandom.hex => { image: file })
      end
    else
      new_craft_images_attributes = {}
    end

    # Merge new image attributes with existing images, if any
    craft_images_attributes = craft_params[:craft_images_attributes].to_h.merge(new_craft_images_attributes)
    craft_attributes = craft_params.merge(craft_images_attributes: craft_images_attributes)

    # Create Shrine Derivatives
    @craft.craft_images.each do |image|
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
    @image = @craft.craft_images[params[:old_position].to_i]
    @image.insert_at(params[:new_position].to_i + 1)
    head :ok
  end
  
  private

  def set_craft
    @craft = Craft.find(params[:craft_id] || params[:id])
  end

  def craft_params
    params
    .require(:craft)
    .permit(
    :name, :category, :subtype, :description, :image,
    craft_images_attributes: [:id, :image, :_destroy])
  end

  def check_if_admin?
    redirect_to root_path unless current_user.admin?
  end
end
