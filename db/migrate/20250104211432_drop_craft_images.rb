class DropCraftImages < ActiveRecord::Migration[7.1]
  def change
    drop_table :craft_images
  end
end
