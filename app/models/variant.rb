class Variant < ApplicationRecord
  belongs_to :craft
  has_many :images, -> { order(position: :asc) }, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true

  validate :must_have_at_least_one_image

  after_save :craft_has_two_or_more_variants
  after_destroy :craft_has_two_or_more_variants

  def craft_price
    price.presence || craft.default_price
  end

  def craft_dimensions
    dimensions.presence || craft.default_dimensions
  end

  private

  def must_have_at_least_one_image
    if images.empty?
      errors.add(:base, "Craft must have at least one Image (can be changed if you'd like)")
    end
  end

  def craft_has_two_or_more_variants
    craft.update_column(:has_variants, craft.variants.many?)
  end
end