Pay.setup do |config|
  # For use in the receipt/refund/renewal mailers
  config.business_name = "Filthy Chai"
  config.business_address = ""
  config.application_name = "Filthy Chai"
  config.support_email = "support@filthychai.me"

  config.default_product_name = "craft"
  config.default_plan_name = "default"

  config.automount_routes = true
  config.routes_path = "/pay" # Only when automount_routes is true
  config.enabled_processors = [:stripe]

  config.send_emails = true
  # By default emails are sent via Pay::UserMailer which inherits from Pay::ApplicationMailer. 
  # Instead, you may wish to inherit from ApplicationMailer, or use a different mailer entirely.
  config.parent_mailer = "ApplicationMailer"
  # config.mailer = "MyCustomPayMailer"

  config.emails.payment_action_required = false
  config.emails.payment_failed = false
  config.emails.receipt = true
  config.emails.refund = true
end

ActiveSupport.on_load(:pay) do
  # checkout.session.async_payment_succeeded - for bank transfer/ACH/SEPA (session completed earlier but payment_status was unpaid)
  # Would require rewrite on FulfillCheckout.call to seperate what is called on each event (complete vs async_payment_succeeded)
  Pay::Webhooks.delegator.subscribe "stripe.checkout.session.completed", FulfillCheckout.new
end