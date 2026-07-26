class Image < ApplicationRecord
  belongs_to :variant
  
  include ImageUploader::Attachment(:image)

  acts_as_list scope: :craft

  validates :image, presence: true
end
