class Variant < ApplicationRecord
  belongs_to :craft
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true

  after_save :craft_has_variants_check
  after_destroy :craft_has_variants_check

  def effective_price
    price.presence || craft.price
  end

  def effective_dimensions
    dimensions.presence || craft.dimensions
  end

  private

  def craft_has_variants_check
    craft.update_column(:has_variants, craft.variants.exists?)
  end
end