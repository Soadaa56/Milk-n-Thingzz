class Craft < ApplicationRecord
  has_many :variants, dependent: :destroy
  has_many :images, through: :variants

  before_create :generate_slug
  before_validation :normalize_name

  validates :name, presence: true
  validate :must_have_at_least_one_variant

  def to_param
    slug
  end

  def cover_image
    images.first
  end

  private

  def generate_slug
    self.slug = name.parameterize
  end

  def normalize_name
    self.name = name.squish if name.present?
  end

  def must_have_at_least_one_image
    if variants.empty?
      errors.add(:base, "Craft must have at least one listing (variant)")
    end
  end
end