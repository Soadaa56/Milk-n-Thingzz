class AddImageDataToCrafts < ActiveRecord::Migration[7.1]
  def change
    add_column :crafts, :image_data, :text
  end
end
