class CraftImage < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :craft
  acts_as_list scope: :craft
end
