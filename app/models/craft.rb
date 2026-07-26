class Craft < ApplicationRecord
  has_many :variants, dependent: :destroy
  has_many :images, through: :variants

  accepts_nested_attributes_for :variants, allow_destroy: true

  before_create :generate_slug
  before_validation :normalize_name

  validates :name, presence: true

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
end