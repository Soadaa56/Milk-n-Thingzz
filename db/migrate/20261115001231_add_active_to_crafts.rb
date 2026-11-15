class AddActiveToCrafts < ActiveRecord::Migration[8.1]
  def change
    add_column :crafts, :active, :boolean, default: true, null: false
  end
end
