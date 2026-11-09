class CreateCartAndCartItemTables < ActiveRecord::Migration[8.1]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true, index: { unique: true }
      t.timestamps
    end

    create_table :cart_items do |t|
      t.references :cart,     null: false, foreign_key: true, index: false
      t.references :variant,  null: false, foreign_key: true
      t.integer :quantity,    null: false, default: 1 
      t.timestamps
    end
    add_index :cart_items, [:cart_id, :variant_id], unique: true
  end
end
