class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items, dependent: :destroy

  enum :status, [ :pending, :paid, :processing, :fulfilled, :cancelled ]

  def self.createOrderFromCart!(cart)
    transaction do
      order = Order.create!(
        user_id: cart.user_id,
        status: :pending,
        subtotal: cart.subtotal
      )

      cart.cart_items.each do |item|
        variant = item.variant
        craft = variant.craft

        OrderItem.create!(
          order_id: order.id,
          craft_id: craft.id,
          variant_id: variant.id,
          craft_name: craft.name,
          variant_name: variant.name,
          sku: variant.sku,
          price: variant.price,
          quantity: item.quantity
        )
      end

      order
    end
  end

end