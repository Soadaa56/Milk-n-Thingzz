ActiveSupport.on_load(:pay) do
  Pay::Webhooks.delegator.subscribe "stripe.checkout.session.completed", FulfillCheckout.new
end