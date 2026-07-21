class ChangeInventoryCountDefaultInCrafts < ActiveRecord::Migration[7.2]
  def up
    change_column_default :crafts, :inventory_count, 0

    execute <<~SQL
      UPDATE crafts
      SET inventory_count = 0
      WHERE inventory_count IS NULL
    SQL

    change_column_null :crafts, :inventory_count, false
  end

  def down
    change_column_null :crafts, :inventory_count, true
    change_column_default :crafts, :inventory_count, nil
  end
end
