class CraftImage < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :craft
  has_one_attached :image
end
