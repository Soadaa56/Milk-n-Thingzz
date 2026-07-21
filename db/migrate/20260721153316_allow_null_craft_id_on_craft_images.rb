class AllowNullCraftIdOnCraftImages < ActiveRecord::Migration[7.2]
  def up
    change_column_null(:craft_images, :craft_id, true)
  end

  def down
    change_column_null(:craft_images, :craft_id, false)
  end
end
