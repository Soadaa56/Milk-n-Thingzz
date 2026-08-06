class CreateCartAndCartItemTables < ActiveRecord::Migration[7.2]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true
      t.timestamps
    end

    create_table :cart_items do |t|
      t.references :cart,     null: false, foreign_key: true
      t.references :variant,  null: false, foreign_key: true
      t.integer :quantity,    null: false, default: 1 
      t.timestamps
    end
  end
end
