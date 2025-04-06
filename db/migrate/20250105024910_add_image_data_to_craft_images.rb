class AddImageDataToCraftImages < ActiveRecord::Migration[7.1]
  def change
    add_column :craft_images, :image_data, :text
  end
end
