class RemovePositionFromCraftImages < ActiveRecord::Migration[7.1]
  def change
    remove_column :craft_images, :position, :integer
  end
end
