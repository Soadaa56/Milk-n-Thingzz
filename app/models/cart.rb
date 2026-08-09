class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :variants, through: :cart_items

  def item_count
    cart_items.sum(:quantity)
  end

  def subtotal
    cart_items.sum(&:item_subtotal)
  end
end