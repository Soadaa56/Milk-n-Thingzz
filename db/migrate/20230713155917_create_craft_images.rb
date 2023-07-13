class CreateCraftImages < ActiveRecord::Migration[7.0]
  def change
    create_table :craft_images do |t|
      t.belongs_to :craft, null: false, foreign_key: true
      t.string :image_path

      t.timestamps
    end
  end
end
