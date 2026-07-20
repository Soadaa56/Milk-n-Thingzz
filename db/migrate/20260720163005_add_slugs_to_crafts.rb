class AddSlugsToCrafts < ActiveRecord::Migration[7.2]
  def change
    add_column :crafts, :slug, :string
    add_index :crafts, :slug, unique: true
  end
end
