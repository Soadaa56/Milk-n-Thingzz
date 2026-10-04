class FulfillCheckout
  def call(event)
    object = event.data.object
    return if object.payment_status != "paid"

    order = Order.find_by(stripe_checkout_session_id: object.id)

    if order.pending?
      ActiveRecord::Base.transaction do
        order.update!(
          status: :paid,
          stripe_payment_intent_id: object.payment_intent,
          shipping_total: object.total_details.amount_shipping,
          tax_total: object.total_details.amount_tax,
          total: object.amount_total,
          paid_at: Time.now
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
    end
    
  rescue StandardError => e
    puts "Error processing webhook: #{e.message}"
  end
end