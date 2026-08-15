class CartItemsController < ApplicationController
  before_action :set_variant, only: [:create]
  before_action :set_cart

  def create
    cart_item = @cart.cart_items.find_or_initialize_by(variant: @variant)

    if cart_item.persisted?
      cart_item.quantity += 1
    end

    if cart_item.save
      redirect_to request.referer || cart_path, notice: "Added to cart"
    else
      redirect_to request.referer || root_path, notice: "Could not add to cart"
    end
  end

  def update
    @cart_item = @cart.cart_items.find(params[:id])
 
    if @cart_item.update(cart_item_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to cart_path }
      end
    end
  end

  def destroy
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy!
    @cart.reload

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to cart_path }
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

  def set_variant
    @variant = Variant.find(params[:variant_id])
  end

  # current_cart found in application_controller
  def set_cart
    @cart = current_cart
  end
end
