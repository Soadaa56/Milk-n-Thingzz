class Craft < ApplicationRecord
  has_many :craft_images
  has_many :comments, dependent: :destroy
  validates :name, presence: true
end
