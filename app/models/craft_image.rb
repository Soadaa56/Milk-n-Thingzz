class CraftImage < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :craft
end
