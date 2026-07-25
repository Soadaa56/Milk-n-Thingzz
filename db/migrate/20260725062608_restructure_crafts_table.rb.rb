class RestructureCraftsTable < ActiveRecord::Migration[7.2]
  def change
    # Update crafts table  as a 'shell' for craft and possible variants
    remove_column :crafts, :image_data, :text

    add_column :crafts, :for_sale, :boolean, default: false, null: false
    add_column :crafts, :has_variants, :boolean, default: false, null: false
    add_column :crafts, :shopify_product_id, :string
    add_column :crafts, :default_price, :decimal, precision: 6, scale: 2
    add_column :crafts, :default_dimensions, :string

    # Create Variants for Crafts (Possible to only have 1 variant)
    create_table :variants do |t|
      t.references :craft,     null: false, foreign_key: true
      t.string  :name
      t.string  :sku
      t.decimal :price,            precision: 6, scale: 2
      t.string  :dimensions
      t.integer :inventory_count,  default: 0, null: false
      t.boolean :active,           default: false, null: false
      t.string  :shopify_variant_id
      t.timestamps
    end

    # Rename and rework images to associate with variants
    remove_foreign_key :craft_images, :crafts
    rename_table :craft_images, :images
    remove_column :images, :craft_id, :integer
    add_reference :images, :variant, foreign_key: true
  end
end
