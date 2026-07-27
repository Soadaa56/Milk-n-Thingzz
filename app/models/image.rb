class Image < ApplicationRecord
  belongs_to :craft, optional: true
  belongs_to :variant, optional: true
  
  include ImageUploader::Attachment(:image)

  acts_as_list scope: [:craft_id, :variant_id]
end
