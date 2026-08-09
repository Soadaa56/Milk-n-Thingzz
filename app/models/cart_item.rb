class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :variant

  validates :quantity, numericality: { greater_than: 0 }

  def item_subtotal
    variant.effective_price * quantity
  end
end