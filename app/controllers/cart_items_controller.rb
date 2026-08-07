class CartItemsController < ApplicationController
  def create
    @cart = current_cart

    cart_item = @cart.cart_items.find_or_create_by.(variant: @variant)
  end

  def destroy
  end
end
