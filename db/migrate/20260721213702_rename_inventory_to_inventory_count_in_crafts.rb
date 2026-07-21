class RenameInventoryToInventoryCountInCrafts < ActiveRecord::Migration[7.2]
  def change
    rename_column :crafts, :inventory, :inventory_count
  end
end
