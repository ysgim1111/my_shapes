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

ActiveRecord::Schema.define(version: 20160819155957) do

  create_table "address_books", force: :cascade do |t|
    t.integer  "user_id",        limit: 4,                   null: false
    t.string   "name",           limit: 255,                 null: false
    t.string   "receiver",       limit: 255,                 null: false
    t.integer  "zonecode",       limit: 8,                   null: false
    t.string   "address",        limit: 255,                 null: false
    t.string   "address_detail", limit: 255
    t.string   "address_type",   limit: 1
    t.string   "phone_number",   limit: 255,                 null: false
    t.string   "tel",            limit: 255
    t.boolean  "default",                    default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "address_books", ["user_id"], name: "index_address_books_on_user_id", using: :btree

  create_table "destinations", force: :cascade do |t|
    t.string   "receiver",         limit: 255,                 null: false
    t.integer  "zonecode",         limit: 8,                   null: false
    t.string   "address",          limit: 255,                 null: false
    t.string   "address_detail",   limit: 255
    t.string   "address_type",     limit: 1
    t.string   "phone_number",     limit: 255,                 null: false
    t.string   "tel",              limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "default",                      default: false
    t.integer  "deliverable_id",   limit: 4
    t.string   "deliverable_type", limit: 255
    t.string   "tracking_number",  limit: 255
    t.string   "demand_message",   limit: 255
    t.integer  "shipping_type",    limit: 4
    t.integer  "shipping_company", limit: 4
    t.date     "shipping_date"
  end

  add_index "destinations", ["deliverable_type", "deliverable_id"], name: "index_destinations_on_deliverable_type_and_deliverable_id", using: :btree

  create_table "influencer_stores", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "url",           limit: 255
    t.text     "desc",          limit: 65535
    t.integer  "selling_point", limit: 4,     default: 0
    t.integer  "user_point",    limit: 4,     default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "influencer_stores", ["user_id"], name: "index_influencer_stores_on_user_id", using: :btree

  create_table "influencer_stores_products", force: :cascade do |t|
    t.integer  "influencer_store_id", limit: 4
    t.integer  "product_id",          limit: 4
    t.integer  "status",              limit: 4,     default: 0
    t.datetime "proposal_date"
    t.text     "comment",             limit: 65535
    t.string   "feed_url",            limit: 255
    t.string   "image_review",        limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "option",              limit: 255
  end

  add_index "influencer_stores_products", ["influencer_store_id"], name: "index_influencer_stores_products_on_influencer_store_id", using: :btree
  add_index "influencer_stores_products", ["product_id"], name: "index_influencer_stores_products_on_product_id", using: :btree

  create_table "product_options", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.string   "name",       limit: 255
    t.integer  "order",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "product_options", ["product_id"], name: "index_product_options_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",                       limit: 255, default: "",   null: false
    t.string   "desc",                       limit: 255
    t.integer  "price",                      limit: 4,   default: 0,    null: false
    t.boolean  "enable",                                 default: true, null: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "discount",                   limit: 4,   default: 0
    t.integer  "shipping_expenses",          limit: 4,   default: 0
    t.integer  "view_type",                  limit: 4,   default: 0,    null: false
    t.string   "image_basic",                limit: 255
    t.string   "image_desc",                 limit: 255
    t.integer  "stack",                      limit: 4
    t.string   "manufacturer",               limit: 255
    t.string   "brand",                      limit: 255
    t.string   "made_in",                    limit: 255
    t.date     "date_of_manufacturing"
    t.date     "use_by_date"
    t.string   "public_phrase",              limit: 255
    t.integer  "minimum_purchase",           limit: 4
    t.integer  "maximum_purchase",           limit: 4
    t.string   "seller_product_code",        limit: 255
    t.date     "sell_by_date"
    t.integer  "status",                     limit: 4
    t.integer  "return_shipping_expenses",   limit: 4
    t.integer  "exchange_shipping_expenses", limit: 4
    t.string   "return_address",             limit: 255
    t.string   "as_tel",                     limit: 255
    t.string   "as_info",                    limit: 255
    t.integer  "user_id",                    limit: 4
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "purchase_items", force: :cascade do |t|
    t.integer  "purchase_list_id", limit: 4,               null: false
    t.integer  "product_id",       limit: 4,               null: false
    t.integer  "quantity",         limit: 4,   default: 1, null: false
    t.integer  "status",           limit: 4,   default: 0, null: false
    t.string   "option",           limit: 255,             null: false
    t.date     "confirm_date"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "purchase_items", ["product_id"], name: "index_purchase_items_on_product_id", using: :btree
  add_index "purchase_items", ["purchase_list_id"], name: "index_purchase_items_on_purchase_list_id", using: :btree

  create_table "purchase_lists", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "status",              limit: 4, default: 0, null: false
    t.integer  "influencer_store_id", limit: 4
  end

  add_index "purchase_lists", ["influencer_store_id"], name: "index_purchase_lists_on_influencer_store_id", using: :btree
  add_index "purchase_lists", ["user_id"], name: "index_purchase_lists_on_user_id", using: :btree

  create_table "purchase_results", force: :cascade do |t|
    t.integer  "purchase_list_id", limit: 4
    t.string   "imp_uid",          limit: 255
    t.string   "pay_method",       limit: 255
    t.string   "name",             limit: 255
    t.integer  "paid_amount",      limit: 4
    t.string   "pg_provider",      limit: 255
    t.string   "pg_tid",           limit: 255
    t.string   "apply_num",        limit: 255
    t.string   "vbank_num",        limit: 255
    t.string   "vbank_name",       limit: 255
    t.string   "vbank_holder",     limit: 255
    t.string   "vbank_date",       limit: 255
    t.string   "buyer_name",       limit: 255
    t.string   "buyer_email",      limit: 255
    t.string   "buyer_tel",        limit: 255
    t.string   "buyer_addr",       limit: 255
    t.string   "buyer_postcode",   limit: 255
    t.text     "custom_data",      limit: 65535
    t.string   "status",           limit: 255
    t.datetime "paid_at"
    t.string   "receipt_url",      limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "card_name",        limit: 255
    t.string   "card_quota",       limit: 255
  end

  add_index "purchase_results", ["purchase_list_id"], name: "index_purchase_results_on_purchase_list_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "shopping_items", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "quantity",   limit: 4, default: 1, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "shopping_items", ["product_id"], name: "index_shopping_items_on_product_id", using: :btree
  add_index "shopping_items", ["user_id"], name: "index_shopping_items_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "provider",               limit: 255
    t.string   "social_uid",             limit: 255
    t.string   "image_profile",          limit: 255
    t.string   "nickname",               limit: 255
    t.string   "phone",                  limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "wannabe_letters", force: :cascade do |t|
    t.integer  "purchase_list_id",    limit: 4,     default: 0,  null: false
    t.integer  "influencer_store_id", limit: 4,     default: 0,  null: false
    t.string   "content",             limit: 255,   default: "", null: false
    t.text     "reply",               limit: 65535
    t.integer  "status",              limit: 4,     default: 0,  null: false
    t.datetime "until_reply_date"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "wannabe_letters", ["influencer_store_id"], name: "index_wannabe_letters_on_influencer_store_id", using: :btree
  add_index "wannabe_letters", ["purchase_list_id"], name: "index_wannabe_letters_on_purchase_list_id", using: :btree

  create_table "wishlist_items", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "quantity",   limit: 4, default: 1, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "wishlist_items", ["product_id"], name: "index_wishlist_items_on_product_id", using: :btree
  add_index "wishlist_items", ["user_id"], name: "index_wishlist_items_on_user_id", using: :btree

end
