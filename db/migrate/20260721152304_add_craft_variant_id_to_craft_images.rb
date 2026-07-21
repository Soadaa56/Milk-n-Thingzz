class AddCraftVariantIdToCraftImages < ActiveRecord::Migration[7.2]
  def change
    add_reference :craft_images, :craft_variant, null: true
  end
end
