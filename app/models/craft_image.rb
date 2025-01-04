class Craft < ApplicationRecord
  belongs_to :craft
  has_one_attached :image
end
