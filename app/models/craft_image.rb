class CraftImage < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :craft, optional: true
  belongs_to :craft_variant, optional: true

  validate :must_belong_to_craft_or_craft_variant

  acts_as_list scope: :craft

  private

  def must_belong_to_craft_or_craft_variant
    if craft_id.blank? && craft_variant_id.blank?
      errors.add(:base, "Must belong to either a craft or a craft variant")
    end
    if craft_id.present? && craft_variant_id.present?
      errors.add(:base, "Cannot belong to both a craft and a craft variant")
    end
  end
end
