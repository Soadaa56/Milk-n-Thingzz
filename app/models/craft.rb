class Craft < ApplicationRecord
  has_many :craft_images
  has_many :comments, dependent: :destroy
end
