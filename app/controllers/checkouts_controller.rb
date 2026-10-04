class CheckoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart
  before_action :verify_cart

  def new
    @cart_items = @cart.cart_items.includes(variant: [:craft, :images])  
  end

  # Assume stripe checkout for now; could refactor for google pay later
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

    order = Order.createOrderFromCart!(@cart)

    session = Stripe::Checkout::Session.create({
      success_url: root_url(success: true),
      cancel_url: root_url,
      line_items: cart_items,
      mode: "payment",
      currency: "usd",
      
      customer_email: current_user.email,
      client_reference_id: current_user.id.to_s,

      excluded_payment_method_types: [
        # Disable all just in case I open up international payments in the future
        "us_bank_account",  # ACH Direct Debit
        "sepa_debit",       # SEPA Direct Debit
        "au_becs_debit",    # BECS Direct Debit (Australia)
        "acss_debit",       # Pre-authorized debit (Canada)
        "bacs_debit",       # Bacs Direct Debit (UK)
      ],
      
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

    order.update!(stripe_checkout_session_id: session.id)

    redirect_to session.url, allow_other_host: true
  rescue Stripe::StripeError => e
    redirect_to cart_path, alert: e.message
  end

  private

  def set_cart
    @cart = current_cart
  end

  def verify_cart
    cart_items_adjusted = false

    @cart.cart_items.each do |item|
      unless item.variant.for_sale? && item.variant.in_stock?
        item.destroy
        cart_items_adjusted = true
        next
      end

      # Assumes stock is > 0 due to above check
      unless item.variant.stock >= item.quantity
        item.update!(quantity: 1)
        cart_items_adjusted = true
      end
    end

    if cart_items_adjusted
      redirect_to new_checkout_path, notice: "Cart adjusted due to stock mismatch!"
    end
  end
end
