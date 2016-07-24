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

ActiveRecord::Schema.define(version: 20160724082338) do

  create_table "influence_products", force: :cascade do |t|
    t.integer  "influence_id"
    t.integer  "product_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "influence_products", ["influence_id"], name: "index_influence_products_on_influence_id"
  add_index "influence_products", ["product_id"], name: "index_influence_products_on_product_id"

  create_table "influences", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "desc"
    t.integer  "selling_point", default: 0
    t.integer  "user_point",    default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "order_sheets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",       default: "",   null: false
    t.string   "desc"
    t.integer  "price",      default: 0,    null: false
    t.boolean  "enable",     default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "purchase_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "order_number", default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "purchase_lists", ["user_id"], name: "index_purchase_lists_on_user_id"

  create_table "purchase_products", force: :cascade do |t|
    t.integer  "purchase_list_id"
    t.integer  "product_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "purchase_products", ["product_id"], name: "index_purchase_products_on_product_id"
  add_index "purchase_products", ["purchase_list_id"], name: "index_purchase_products_on_purchase_list_id"

  create_table "purchase_results", force: :cascade do |t|
    t.integer  "purchase_list_id"
    t.string   "imp_uid"
    t.string   "pay_method"
    t.string   "merchant_uid"
    t.string   "name"
    t.integer  "paid_amount"
    t.string   "pg_provider"
    t.string   "pg_tid"
    t.string   "apply_num"
    t.string   "vbank_num"
    t.string   "vbank_name"
    t.string   "vbank_holder"
    t.string   "vbank_date"
    t.string   "buyer_name"
    t.string   "buyer_email"
    t.string   "buyer_tel"
    t.string   "buyer_addr"
    t.string   "buyer_postcode"
    t.text     "custom_data"
    t.string   "status"
    t.datetime "paid_at"
    t.string   "receipt_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "purchase_results", ["purchase_list_id"], name: "index_purchase_results_on_purchase_list_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "shopping_baskets", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shopping_baskets", ["user_id"], name: "index_shopping_baskets_on_user_id"

  create_table "shopping_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "quantity",   default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "shopping_items", ["product_id"], name: "index_shopping_items_on_product_id"
  add_index "shopping_items", ["user_id"], name: "index_shopping_items_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

  create_table "wishlist_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "quantity",   default: 1, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "wishlist_items", ["product_id"], name: "index_wishlist_items_on_product_id"
  add_index "wishlist_items", ["user_id"], name: "index_wishlist_items_on_user_id"

  create_table "wishlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
