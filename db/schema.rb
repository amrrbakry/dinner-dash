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

ActiveRecord::Schema.define(version: 20170501165154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "category_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",                precision: 8, scale: 2
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "parent_item_id"
    t.index ["title"], name: "index_items_on_title", using: :btree
  end

  create_table "options", force: :cascade do |t|
    t.string   "name"
    t.integer  "item_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "o_picture_file_name"
    t.string   "o_picture_content_type"
    t.integer  "o_picture_file_size"
    t.datetime "o_picture_updated_at"
    t.text     "description"
    t.index ["item_id"], name: "index_options_on_item_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 8, scale: 2
    t.integer  "quantity"
    t.decimal  "total_price", precision: 8, scale: 2
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.text     "extras",                              default: [],              array: true
    t.index ["item_id"], name: "index_order_items_on_item_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",        precision: 8, scale: 2
    t.decimal  "tax",             precision: 8, scale: 2
    t.decimal  "total",           precision: 8, scale: 2
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "order_status_id"
    t.index ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "values", force: :cascade do |t|
    t.string   "name"
    t.decimal  "additional_charge", precision: 8, scale: 2, default: "0.0", null: false
    t.integer  "option_id"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.index ["option_id"], name: "index_values_on_option_id", using: :btree
  end

  add_foreign_key "options", "items"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "values", "options"
end
