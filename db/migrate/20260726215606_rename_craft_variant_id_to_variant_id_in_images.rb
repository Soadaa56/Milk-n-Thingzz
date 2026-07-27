class RenameCraftVariantIdToVariantIdInImages < ActiveRecord::Migration[7.2]
  def change
    rename_column :images, :craft_variant_id, :variant_id
    rename_index :images, :index_images_on_craft_variant_id, :index_images_on_variant_id
  end
end
