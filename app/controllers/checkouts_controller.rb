class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def new
    @cart_items = @cart.cart_items.includes(variant: [:craft, :images])  
  end

  def create
    cart_items = @cart.cart_items.map do |item|
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
      currency: "usd",
      
      customer_email: current_user.email,
      client_reference_id: current_user.id.to_s,
      
      automatic_tax: { enabled: true },
      shipping_address_collection: {
        allowed_countries: ["US"]
      },
      billing_address_collection: "required",
      shipping_options: [
        shipping_rate_data: {
          type: "fixed_amount",
          fixed_amount: { amount: 500, currency: "usd" },
          display_name: "Standard Shipping (5-10 business days)",
          tax_behavior: "exclusive"
        }
      ],

      metadata: {
        user_id: current_user.id.to_s,
        cart_id: @cart.id.to_s
      }
    })

    redirect_to session.url, allow_other_host: true
  rescue Stripe::StripeError => e
    redirect_to cart_path, alert: e.message
  end

  private

  def set_cart
    @cart = current_cart
  end
end
