class Craft < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, presence: true

  include ImageUploader::Attachment(:image)
  has_many :craft_images, dependent: :destroy
  accepts_nested_attributes_for :craft_images, allow_destroy: true
end
