class AddDescriptionToCrafts < ActiveRecord::Migration[7.1]
  def change
    add_column :crafts, :description, :text
  end
end
