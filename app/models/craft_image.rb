class CraftImage < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :craft, optional: true
  belongs_to :craft_variant, optional: true

  acts_as_list scope: :craft
end
