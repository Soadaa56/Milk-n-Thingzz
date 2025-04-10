class Craft < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, presence: true

  include ImageUploader::Attachment(:image)
  has_many :craft_images, -> { order(position: :asc) }, dependent: :destroy
  accepts_nested_attributes_for :craft_images, allow_destroy: true
  validate :must_have_at_least_one_image

  def must_have_at_least_one_image
    if craft_images.empty?
      errors.add(:base, "Craft must have at least one image")
    end
  end
end


# Might add this on admin page for small preview of craft image
# Change to image references not video

# class User < ApplicationRecord
#   has_one_attached :video do |attachable|
#     attachable.variant :thumb, resize_to_limit: [100, 100]
#   end
# end
# %= image_tag user.video.preview(:thumb) %
