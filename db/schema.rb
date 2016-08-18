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

ActiveRecord::Schema.define(version: 20160817131658) do

  create_table "address_books", force: :cascade do |t|
    t.integer  "user_id",                                  null: false
    t.string   "name",                                     null: false
    t.string   "receiver",                                 null: false
    t.integer  "zonecode",       limit: 5,                 null: false
    t.string   "address",                                  null: false
    t.string   "address_detail"
    t.string   "address_type",   limit: 1
    t.string   "phone_number",                             null: false
    t.string   "tel"
    t.boolean  "default",                  default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "address_books", ["user_id"], name: "index_address_books_on_user_id"

  create_table "destinations", force: :cascade do |t|
    t.string   "receiver",                                   null: false
    t.integer  "zonecode",         limit: 5,                 null: false
    t.string   "address",                                    null: false
    t.string   "address_detail"
    t.string   "address_type",     limit: 1
    t.string   "phone_number",                               null: false
    t.string   "tel"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "default",                    default: false
    t.integer  "deliverable_id"
    t.string   "deliverable_type"
    t.string   "tracking_number"
    t.string   "demand_message"
    t.integer  "shipping_type"
    t.integer  "shipping_company"
    t.date     "shipping_date"
  end

  add_index "destinations", ["deliverable_type", "deliverable_id"], name: "index_destinations_on_deliverable_type_and_deliverable_id"

  create_table "influencer_stores", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "url"
    t.text     "desc"
    t.integer  "selling_point", default: 0
    t.integer  "user_point",    default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "influencer_stores", ["user_id"], name: "index_influencer_stores_on_user_id"

  create_table "influencer_stores_products", force: :cascade do |t|
    t.integer  "influencer_store_id"
    t.integer  "product_id"
    t.integer  "status",              default: 0
    t.datetime "proposal_date"
    t.text     "comment"
    t.string   "feed_url"
    t.string   "image_review"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "influencer_stores_products", ["influencer_store_id"], name: "index_influencer_stores_products_on_influencer_store_id"
  add_index "influencer_stores_products", ["product_id"], name: "index_influencer_stores_products_on_product_id"

  create_table "product_options", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "name"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "product_options", ["product_id"], name: "index_product_options_on_product_id"

  create_table "products", force: :cascade do |t|
    t.string   "name",                       default: "",   null: false
    t.string   "desc"
    t.integer  "price",                      default: 0,    null: false
    t.boolean  "enable",                     default: true, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "discount",                   default: 0
    t.integer  "shipping_expenses",          default: 0
    t.integer  "view_type",                  default: 0,    null: false
    t.string   "image_basic"
    t.string   "image_desc"
    t.integer  "stack"
    t.string   "manufacturer"
    t.string   "brand"
    t.string   "made_in"
    t.date     "date_of_manufacturing"
    t.date     "use_by_date"
    t.string   "public_phrase"
    t.integer  "minimum_purchase"
    t.integer  "maximum_purchase"
    t.string   "seller_product_code"
    t.date     "sell_by_date"
    t.integer  "status"
    t.integer  "return_shipping_expenses"
    t.integer  "exchange_shipping_expenses"
    t.string   "return_address"
    t.string   "as_tel"
    t.string   "as_info"
    t.integer  "user_id"
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id"

  create_table "purchase_items", force: :cascade do |t|
    t.integer  "purchase_list_id",             null: false
    t.integer  "product_id",                   null: false
    t.integer  "quantity",         default: 1, null: false
    t.integer  "status",           default: 0, null: false
    t.string   "option",                       null: false
    t.date     "confirm_date"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "purchase_items", ["product_id"], name: "index_purchase_items_on_product_id"
  add_index "purchase_items", ["purchase_list_id"], name: "index_purchase_items_on_purchase_list_id"

  create_table "purchase_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "merchant_uid"
    t.integer  "status",              default: 0, null: false
    t.integer  "influencer_store_id"
  end

  add_index "purchase_lists", ["influencer_store_id"], name: "index_purchase_lists_on_influencer_store_id"
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
    t.string   "card_name"
    t.string   "card_quota"
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
    t.string   "provider"
    t.string   "social_uid"
    t.string   "image_profile"
    t.string   "nickname"
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

end
