class Variant < ApplicationRecord
  include ActiveSupport::NumberHelper

  belongs_to :craft
  has_many :images, -> { order(position: :asc) }, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true

  after_save :craft_has_many_variants
  after_destroy :craft_has_many_variants

  def effective_price
    number_to_currency(price.presence) || number_to_currency(craft.default_price)
  end

  def effective_dimensions
    dimensions.presence || craft.default_dimensions
  end

  def in_stock?
    stock.nil? || inventory_count > 0
  end

  def tracks_inventory?
    stock.present?
  end

  def for_sale?
    craft.for_sale? && active?
  end

  private

  def craft_has_many_variants
    craft.update_column(:has_variants, craft.variants.many?)
  end
end