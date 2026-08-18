class AddDetailsToCrafts < ActiveRecord::Migration[8.1]
  def change
    add_column :crafts, :details, :text
  end
end
