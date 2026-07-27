class VariantsController < ApplicationController
  before_action :check_if_admin?, :set_craft
  before_action :set_variant, only: [:edit, :update, :destroy]
  def index
  end

  def new
    @variant = Variant.new
  end
  
  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def set_craft
    @craft = Craft.find_by!(slug: params[:craft_id])
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
