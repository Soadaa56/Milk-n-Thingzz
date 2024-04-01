class Craft < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :comments, dependent: :destroy
  validates :name, presence: true
end
