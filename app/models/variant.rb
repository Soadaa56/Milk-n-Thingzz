class Variant < ApplicationRecord
  belongs_to :craft
  
  has_many :images, -> { order(position: :asc) }, dependent: :destroy
  has_many :cart_items, dependent: :restrict_with_error
  has_many :carts, through: :cart_items

  accepts_nested_attributes_for :images, allow_destroy: true

  before_validation :normalize_sku

  after_save :craft_has_many_variants
  after_destroy :craft_has_many_variants

  def effective_price
    price.presence || craft.default_price
  end

  def effective_dimensions
    dimensions.presence || craft.default_dimensions
  end

  def in_stock?
    stock.nil? || stock > 0
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

  def normalize_sku
    self.sku = nil if sku.blank?
  end
end