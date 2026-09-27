class CreateOrderItems < ActiveRecord::Migration[8.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true

      t.references :craft, null: false, foreign_key: true
      t.references :variant, null: false, foreign_key: true

      t.string :craft_name, null: false
      t.string :variant_name
      t.string :sku

      t.decimal :price, precision: 7, scale: 2, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
