class AddPositionToCraftImages < ActiveRecord::Migration[7.1]
  def change
    add_column :craft_images, :position, :integer
    Craft.all.each do |craft|
      craft.craft_images.order(:updated_at).each.with_index(1) do |craft_image, index|
        craft_image.update_column :position, index
      end
    end
  end
end
