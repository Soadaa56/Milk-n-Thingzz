class CheckoutsController < ApplicationController
  def new
    @cart = current_cart
    @cart_items = @cart.cart_items.includes(variant: [:craft, :images])  
  end

  def create
    cart_items = cart_params[:cart_items].map do |item|
      product = Variant.find(item[:variant_id])

      {
        price_data: {
          currency: "usd",
          unit_amount: (product.price * 100).to_i,
          product_data: {
            name: product.craft.name,
            description: product.name,
          }
        },
        quantity: item[:quantity]
    }
    end

    session = Stripe::Checkout::Session.create({
      success_url: root_url(success: true),
      cancel_url: root_url,
      line_items: cart_items,
      mode: "payment",

      customer_email: current_user.email,
      client_reference_id: current_user.id.to_s,

      shipping_address_collection: {
        allowed_countries: ["US"]
      },

      metadata: {
        user_id: current_user.id.to_s
      }
    })

    redirect_to session.url, allow_other_host: true
  end

  private

  def cart_params
    params.require(:checkout).permit(cart_items: [])
  end
end
