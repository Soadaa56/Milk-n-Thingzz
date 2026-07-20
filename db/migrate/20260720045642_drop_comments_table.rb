class DropCommentsTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :comments
  end
end
