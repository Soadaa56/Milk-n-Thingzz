class AddSellingInformationToCrafts < ActiveRecord::Migration[7.2]
  def change
    add_column :crafts, :for_sale, :boolean, default: false, null: false
    add_column :crafts, :has_variants, :boolean, default: false, null: false
    add_column :crafts, :inventory, :integer
    add_column :crafts, :price, :decimal, precision: 5, scale: 2
    add_column :crafts, :dimensions, :string
  end
end
