class Image < ApplicationRecord
  include ImageUploader::Attachment(:image)
  
  belongs_to :variant

  acts_as_list scope: :variant

  validates :image_data, presence: true, on: :create
end
