class Craft < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, presence: true

  include ImageUploader::Attachment(:image)
  has_many :craft_images, dependent: :destroy
  accepts_nested_attributes_for :craft_images, allow_destroy: true
end


# Might add these on admin page for small preview image of craft, change to image references
# class User < ApplicationRecord
#   has_one_attached :video do |attachable|
#     attachable.variant :thumb, resize_to_limit: [100, 100]
#   end
# end
# %= image_tag user.video.preview(:thumb) %
