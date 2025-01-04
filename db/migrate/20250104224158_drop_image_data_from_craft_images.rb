class DropImageDataFromCraftImages < ActiveRecord::Migration[7.1]
  def change
    remove_column :craft_images, :image_data, :text
  end
end
