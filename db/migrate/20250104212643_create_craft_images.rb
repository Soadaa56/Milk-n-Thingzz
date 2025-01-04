class CreateCraftImages < ActiveRecord::Migration[7.1]
  def change
    create_table :craft_images do |t|
      t.references :craft, null: false, foreign_key: true
      t.text :image_data

      t.timestamps
    end
  end
end
