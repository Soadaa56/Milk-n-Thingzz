class RemoveBioFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :bio
  end
end
