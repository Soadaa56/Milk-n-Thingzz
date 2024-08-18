class AddSubtypeToCrafts < ActiveRecord::Migration[7.1]
  def change
    add_column :crafts, :subtype, :string
  end
end
