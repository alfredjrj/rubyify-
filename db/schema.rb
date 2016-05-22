# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160520033316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_orders", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "order_id"
    t.float    "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
  end

  add_index "item_orders", ["item_id"], name: "index_item_orders_on_item_id", using: :btree
  add_index "item_orders", ["order_id"], name: "index_item_orders_on_order_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.float    "price"
    t.integer  "quantity"
    t.string   "name"
    t.text     "description"
    t.string   "sku"
    t.boolean  "inventory"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "store_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "items", ["store_id"], name: "index_items_on_store_id", using: :btree

  create_table "links", force: :cascade do |t|
    t.text     "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "store_id"
  end

  add_index "links", ["store_id"], name: "index_links_on_store_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.float    "subtotal"
    t.float    "total"
    t.float    "shipping"
    t.boolean  "status"
    t.text     "receipt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "store_id"
  end

  add_index "orders", ["store_id"], name: "index_orders_on_store_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.text     "template"
    t.integer  "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pages", ["store_id"], name: "index_pages_on_store_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.integer  "phone"
    t.string   "address"
    t.text     "about"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "stores", ["name"], name: "index_stores_on_name", unique: true, using: :btree
  add_index "stores", ["user_id"], name: "index_stores_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "item_orders", "items"
  add_foreign_key "item_orders", "orders"
  add_foreign_key "items", "stores"
  add_foreign_key "links", "stores"
  add_foreign_key "orders", "stores"
  add_foreign_key "pages", "stores"
  add_foreign_key "stores", "users"
end
