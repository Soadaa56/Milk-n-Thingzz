class CartItemsController < ApplicationController
  before_action :current_cart, :set_variant

  def create
    cart_item = @cart.cart_items.find_or_create_by(variant: @variant)
    cart_item.quantity = (cart_item.quantity || 0) + 1

    if cart_item.save
      redirect_to request.referer || cart_path, notice: "Added to cart"
    else
      redirect_to request.referer || root_path, notice: "Could not add to cart"
    end
  end

  def update
  end

  def destroy
    cart_item = @cart.cart_items.find(variant: @variant)
    cart_item.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to cart_path }
    end
  end

  private

  def current_cart
    @cart = current_cart
  end

  def set_variant
    @variant = Variant.find(params[:variant_id])
  end
end
