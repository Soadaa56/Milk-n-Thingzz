class RecreateSchemeTablesForCraftsImagesVariants < ActiveRecord::Migration[7.2]
  def change
    create_table :crafts do |t|
      t.string :name, null: false
      t.text :description
      t.string :category
      t.string :subtype
      t.string :slug,                 null: false
      t.boolean :for_sale,            default: false, null: false
      t.boolean :has_many_variants,   default: false, null: false
      t.decimal :default_price,       precision: 6, scale: 2
      t.string :default_dimensions
      t.string :shopify_product_id
      t.timestamps
    end
    add_index :crafts, :slug, unique: true

    create_table :variants do |t|
      t.references :craft,            null: false, foreign_key: true
      t.string :name
      t.string :sku
      t.decimal :price,               precision: 6, scale: 2
      t.integer :inventory_count,     null: true
      t.boolean :active,              default: true, null: false
      t.string :shopify_variant_id
      t.timestamps
    end

    create_table :images do |t|
      t.references :variant,          foreign_key: true
      t.text :image_data
      t.integer :position,            default: 0
      t.timestamps
    end
  end
end
