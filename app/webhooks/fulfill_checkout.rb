class FulfillCheckout
  # config/initializers/pay.rb
  # Currently only for stripe.checkout.session.completed
  def call(event)
    object = event.data.object
    shipping = object.collected_information.shipping_details
    return if object.payment_status != "paid"

    order = Order.find_by(stripe_checkout_session_id: object.id)

    if order.pending?
      Rails.logger.tagged("StripeObjectTesting") do
        Rails.logger.info "Processing transaction..."
        Rails.logger.info object
      end

      ActiveRecord::Base.transaction do
        order.update!(
          status: :paid,
          stripe_payment_intent_id: object.payment_intent,
          shipping_total: object.total_details.amount_shipping,
          tax_total: object.total_details.amount_tax,
          total: object.amount_total,
          paid_at: Time.now,
          shipping_name: shipping.name || object.name,
          shipping_address_line1: shipping.address.line1,
          shipping_address_line2: shipping.address.line2,
          shipping_city: shipping.address.city,
          shipping_state: shipping.address.state,
          shipping_postal_code: shipping.address.postal_code,
          shipping_country: shipping.address.country
          )

        order.order_items.each do |item|
          variant = Variant.find(item.variant_id)
          variant_new_stock = variant.stock - item.quantity
          variant.update!(stock: variant_new_stock)
        end
      end

      user = User.find(order.user_id)
      user.cart.empty_cart

      # email admin/push notifacation
      NotifyMailer.with(email: Rails.application.credentials.dig(:email, :milk), order: order.id)
                  .notify_sale
                  .deliver_now
    end
    
  rescue StandardError => e
    puts "Error processing webhook: #{e.message}"
  end
end