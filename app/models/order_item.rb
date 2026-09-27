class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :craft
  belongs_to :variant
end