# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_28_202942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "brand"
    t.string "name"
    t.string "category"
    t.integer "quantity"
    t.float "cost"
    t.integer "purchases"
    t.boolean "available"
    t.boolean "special"
    t.boolean "restricted"
    t.boolean "age_restricted"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "popularity"
    t.bigint "user_id", null: false
    t.float "tax"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "cart_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity", default: 1
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["item_id"], name: "index_line_items_on_item_id"
  end

<<<<<<< HEAD
  create_table "order_items", force: :cascade do |t|
    t.integer "quantity"
    t.integer "item_id"
    t.integer "order_id"
    t.decimal "unit_price"
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "subtotal"
    t.decimal "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
=======
  create_table "orders", force: :cascade do |t|
    t.integer "status"
    t.integer "quantity"
    t.integer "price"
    t.bigint "user_id"
    t.bigint "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "user_name"
    t.index ["item_id"], name: "index_orders_on_item_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
>>>>>>> 0d5dfc08ea02bca9980fe799b8f45540cc64eb28
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "item_id"
  end

  create_table "subscribes", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_subscribes_on_item_id"
    t.index ["user_id"], name: "index_subscribes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "name"
    t.bigint "phone"
    t.date "dob"
    t.string "address"
    t.string "card_name"
    t.string "card_number"
    t.date "exp"
    t.integer "cvv"
<<<<<<< HEAD
=======
    t.string "otp_secret_key"
    t.string "provider"
    t.string "uid"
>>>>>>> 0d5dfc08ea02bca9980fe799b8f45540cc64eb28
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wish_items", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "wishlist_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity", default: 1
    t.index ["item_id"], name: "index_wish_items_on_item_id"
    t.index ["wishlist_id"], name: "index_wish_items_on_wishlist_id"
  end

  create_table "wishlists", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "items", "users"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "items"
<<<<<<< HEAD
  add_foreign_key "subscribes", "items"
  add_foreign_key "subscribes", "users"
  add_foreign_key "wish_items", "items"
  add_foreign_key "wish_items", "wishlists"
=======
<<<<<<< HEAD
  add_foreign_key "subscribes", "items"
  add_foreign_key "subscribes", "users"
=======
  add_foreign_key "orders", "items"
  add_foreign_key "orders", "users"
>>>>>>> 90bc630e3b2ccb557da72ecb25612f3ac87a94d7
>>>>>>> 0d5dfc08ea02bca9980fe799b8f45540cc64eb28
end
