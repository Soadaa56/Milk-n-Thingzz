class RenameCraftImagesAndCraftVariants < ActiveRecord::Migration[7.2]
  def change
    rename_table :craft_images, :images
    rename_table :craft_variants, :variants
  end
end