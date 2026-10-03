class FulfillCheckout
  def call(event)
    object = event.data.object

    return if object.payment_status != "paid"

    # Handle fulfillment
    puts "=" * 40
    puts JSON.pretty_generate(object.to_hash)
    puts "=" * 40
  rescue StandardError => e
    puts "Error processing webhook: #{e.message}"
  end
end