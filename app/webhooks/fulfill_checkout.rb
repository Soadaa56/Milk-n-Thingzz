class FulfillCheckout
  def call(event)
    object = event.data.object
    return if object.payment_status != "paid"

    order = Order.find(stripe_checkout_session_id: object.id)

    if order.pending?
      order.update!(
        status: :paid,
        stripe_payment_intent_id: object.payment_intent,
        shipping_total: object.total_details.amount_shipping,
        tax_total: object.total_details.amount_tax,
        total: object.amount_total,
        paid_at: Time.now
        )

      # email admin/push notifacation
      
      user = User.find(order.user_id)
      user.cart.empty_cart
    end
    
  rescue StandardError => e
    puts "Error processing webhook: #{e.message}"
  end
end