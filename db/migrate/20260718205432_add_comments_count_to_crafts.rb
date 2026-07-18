class AddCommentsCountToCrafts < ActiveRecord::Migration[7.2]
  def change
    add_column :crafts, :comments_count, :integer
  end
end
