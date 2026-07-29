class RecreateSchemeTablesForCraftsImagesVariants < ActiveRecord::Migration[7.2]
  def change
    create_table :crafts do |t|
      t.string :name, null: false
      t.text :description
      t.string :category
      t.string :subtype
      t.string :slug,                 null: false
      t.boolean :for_sale,            default: false, null: false
      t.boolean :has_variants,        default: false, null: false
      t.decimal :default_price,       precision: 7, scale: 2
      t.string :default_dimensions
      t.string :shopify_product_id
      t.timestamps
    end
    add_index :crafts, :slug, unique: true
    add_index :crafts, :for_sale

    create_table :variants do |t|
      t.references :craft,            null: false, foreign_key: true
      t.string :name
      t.string :sku                   
      t.decimal :price,               precision: 7, scale: 2
      t.integer :stock,               null: true
      t.string :dimensions,           null: true
      t.boolean :active,              default: true, null: false
      t.string :shopify_variant_id
      t.timestamps
    end
    add_index :variants, :active
    add_index :variants, :sku, unique: true, where: "sku IS NOT NULL"

    create_table :images do |t|
      t.references :variant,          foreign_key: true
      t.text :image_data
      t.integer :position,            default: 0
      t.timestamps
    end
  end
end
