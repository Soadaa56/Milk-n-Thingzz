class Image < ApplicationRecord
  belongs_to :variant
  
  include ImageUploader::Attachment(:image)

  acts_as_list scope: :variant

  validates :image_data, presence: true, on: :create
end
