class CraftVariant < ApplicationRecord
  belongs_to :craft
  has_many :craft_images, dependent: :destroy

  def effective_price
    price.presence || craft.price
  end

  def effective_dimensions
    dimensions.presence || craft.dimensions
  end
end