class CreateCraftVariants < ActiveRecord::Migration[7.2]
  def change
    create_table :craft_variants do |t|
      t.references :craft, null: false, foreign_key: true
      t.string :name
      t.decimal :price, precision: 5, scale: 2
      t.integer :inventory_count
      t.string :dimensions  
      t.timestamps
    end
  end
end
