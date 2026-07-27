# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2026_07_27_150117) do
  create_table "crafts", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "category"
    t.string "subtype"
    t.string "slug", null: false
    t.boolean "for_sale", default: false, null: false
    t.boolean "has_many_variants", default: false, null: false
    t.decimal "default_price", precision: 6, scale: 2
    t.string "default_dimensions"
    t.string "shopify_product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_crafts_on_slug", unique: true
  end

  create_table "images", force: :cascade do |t|
    t.integer "variant_id"
    t.text "image_data"
    t.integer "position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["variant_id"], name: "index_images_on_variant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variants", force: :cascade do |t|
    t.integer "craft_id", null: false
    t.string "name"
    t.string "sku"
    t.decimal "price", precision: 6, scale: 2
    t.integer "inventory_count"
    t.string "dimensions"
    t.boolean "active", default: true, null: false
    t.string "shopify_variant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["craft_id"], name: "index_variants_on_craft_id"
  end

  add_foreign_key "images", "variants"
  add_foreign_key "variants", "crafts"
end
