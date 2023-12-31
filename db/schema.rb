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

ActiveRecord::Schema[7.1].define(version: 2023_12_14_051816) do
  create_table "addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "postal_code"
    t.string "prefecture"
    t.string "city"
    t.string "town"
    t.string "building_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "name"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cart_details", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "cart_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "num", default: 0, null: false
    t.index ["cart_id", "item_id"], name: "index_cart_details_on_cart_id_and_item_id", unique: true
    t.index ["cart_id"], name: "index_cart_details_on_cart_id"
    t.index ["item_id"], name: "index_cart_details_on_item_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.boolean "ordered_flg", default: false, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "product_name"
    t.text "product_image"
    t.integer "price"
    t.string "description"
    t.boolean "hidden"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "cart_id", null: false
    t.integer "address_id", null: false
    t.integer "payment_id", default: 1, null: false
    t.integer "shipping_fee", null: false
    t.integer "cash_fee", null: false
    t.integer "subtotal", null: false
    t.integer "total", null: false
    t.integer "total_tax", null: false
    t.date "delivery_date", null: false
    t.string "delivery_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["payment_id"], name: "index_orders_on_payment_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "payment_method", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin_flg", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cart_details", "carts"
  add_foreign_key "cart_details", "items"
  add_foreign_key "carts", "users"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "payments"
  add_foreign_key "orders", "users"
end
