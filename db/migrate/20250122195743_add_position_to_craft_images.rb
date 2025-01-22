class AddPositionToCraftImages < ActiveRecord::Migration[7.1]
  def change
    add_column :craft_images, :position, :integer
  end
end
