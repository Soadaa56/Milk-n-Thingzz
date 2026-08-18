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

ActiveRecord::Schema[8.1].define(version: 2026_08_18_122151) do
  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.datetime "created_at", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "updated_at", null: false
    t.integer "variant_id", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["variant_id"], name: "index_cart_items_on_variant_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "crafts", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.string "default_dimensions"
    t.decimal "default_price", precision: 7, scale: 2
    t.text "description"
    t.text "details"
    t.boolean "for_sale", default: false, null: false
    t.boolean "has_variants", default: false, null: false
    t.string "name", null: false
    t.string "shopify_product_id"
    t.string "slug", null: false
    t.string "subtype"
    t.datetime "updated_at", null: false
    t.index ["for_sale"], name: "index_crafts_on_for_sale"
    t.index ["slug"], name: "index_crafts_on_slug", unique: true
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "image_data"
    t.integer "position", default: 0
    t.datetime "updated_at", null: false
    t.integer "variant_id"
    t.index ["variant_id"], name: "index_images_on_variant_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "confirmation_sent_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "locked_at"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "role", default: 0
    t.string "unconfirmed_email"
    t.string "unlock_token"
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "variants", force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.integer "craft_id", null: false
    t.datetime "created_at", null: false
    t.string "dimensions"
    t.string "name"
    t.decimal "price", precision: 7, scale: 2
    t.string "shopify_variant_id"
    t.string "sku"
    t.integer "stock"
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_variants_on_active"
    t.index ["craft_id"], name: "index_variants_on_craft_id"
    t.index ["sku"], name: "index_variants_on_sku", unique: true, where: "sku IS NOT NULL"
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "variants"
  add_foreign_key "carts", "users"
  add_foreign_key "images", "variants"
  add_foreign_key "variants", "crafts"
end
