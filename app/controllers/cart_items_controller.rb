class CartItemsController < ApplicationController
  def create
    @cart = current_cart
    @variant = Variant.find(params[:variant_id])

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
  end
end
