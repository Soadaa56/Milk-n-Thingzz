class Craft < ApplicationRecord
  include ImageUploader::Attachment(:image)

  has_many :craft_images, -> { order(position: :asc) }, dependent: :destroy

  accepts_nested_attributes_for :craft_images, allow_destroy: true

  before_validation :normalize_name

  validate :must_have_at_least_one_image
  validates :name, presence: true


  private

  def normalize_name
    self.name = name.squish if name.present?
  end

  def must_have_at_least_one_image
    if craft_images.empty?
      errors.add(:base, "Craft must have at least one image")
    end
  end
end