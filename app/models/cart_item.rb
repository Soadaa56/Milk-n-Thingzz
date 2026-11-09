class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :variant

  # Should not need to sell 20+; also validate order does not exceed stock
  validates :quantity, numericality: {
                        only_integer: true,
                        greater_than: 0,
                        less_than_or_equal_to: 20
                        }
  validate :quantity_does_not_exceed_stock


  def item_subtotal
    variant.effective_price * quantity
  end

  private

  def quantity_does_not_exceed_stock
    return unless variant

    if quantity.present? && quantity > variant.stock
      errors.add(
        :quantity,
        "Cannot exceed available stock (#{variant.stock})"
      )
    end
  end
end