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

ActiveRecord::Schema.define(version: 20171205035052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street_address"
    t.string   "suite_apt"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "customer_id"
    t.string   "suburb"
  end

  add_index "addresses", ["customer_id"], name: "index_addresses_on_customer_id", using: :btree

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "category"
    t.text     "content"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "slug"
    t.boolean  "published",          default: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "external_link"
    t.string   "author"
  end

  add_index "articles", ["category"], name: "index_articles_on_category", using: :btree
  add_index "articles", ["slug"], name: "index_articles_on_slug", using: :btree

  create_table "campaign_subscribers", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "subscriber_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "campaign_subscribers", ["campaign_id"], name: "index_campaign_subscribers_on_campaign_id", using: :btree
  add_index "campaign_subscribers", ["subscriber_id"], name: "index_campaign_subscribers_on_subscriber_id", using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.string   "pdf_title"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "campaign_subscribers_count", default: 0
    t.string   "description"
    t.string   "short_description"
    t.boolean  "active"
    t.string   "strategy"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "cart_product_ingredients", force: :cascade do |t|
    t.integer  "cart_product_id"
    t.integer  "ingredient_id"
    t.integer  "percentage"
    t.decimal  "price"
    t.integer  "weight"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "cart_product_ingredients", ["cart_product_id"], name: "index_cart_product_ingredients_on_cart_product_id", using: :btree
  add_index "cart_product_ingredients", ["ingredient_id"], name: "index_cart_product_ingredients_on_ingredient_id", using: :btree

  create_table "cart_products", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "unit_price"
    t.decimal  "total_price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cart_products", ["cart_id"], name: "index_cart_products_on_cart_id", using: :btree
  add_index "cart_products", ["product_id"], name: "index_cart_products_on_product_id", using: :btree

  create_table "cart_transitions", force: :cascade do |t|
    t.string   "to_state",                 null: false
    t.json     "metadata",    default: {}
    t.integer  "sort_key",                 null: false
    t.integer  "cart_id",                  null: false
    t.boolean  "most_recent",              null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "cart_transitions", ["cart_id", "most_recent"], name: "index_cart_transitions_parent_most_recent", unique: true, where: "most_recent", using: :btree
  add_index "cart_transitions", ["cart_id", "sort_key"], name: "index_cart_transitions_parent_sort", unique: true, using: :btree

  create_table "carts", force: :cascade do |t|
    t.decimal  "total"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "reference_number"
    t.string   "stripe_token"
    t.integer  "customer_id"
    t.string   "invoice_file_name"
    t.integer  "coupon_id"
    t.decimal  "shipping_fee",      precision: 10, scale: 2
    t.decimal  "subtotal",          precision: 8,  scale: 2
    t.datetime "delivery_at"
  end

  add_index "carts", ["coupon_id"], name: "index_carts_on_coupon_id", using: :btree
  add_index "carts", ["customer_id"], name: "index_carts_on_customer_id", using: :btree

  create_table "cooks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "code"
    t.integer  "amount"
    t.boolean  "active"
    t.string   "description"
    t.integer  "redemption_limit"
    t.string   "rule"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "ingredient_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "color"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ingredient_nutrition_facts", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "unit_id"
    t.integer  "ingredient_id"
    t.integer  "nutrition_fact_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.decimal  "amount_mg",         precision: 10, scale: 2
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.integer  "amount"
    t.integer  "unit_id"
    t.string   "tags"
    t.boolean  "premium",                                        default: false
    t.integer  "ingredient_category_id"
    t.integer  "ph"
    t.boolean  "antioxidant"
    t.decimal  "price_per_gram",         precision: 6, scale: 4
    t.string   "external_link"
  end

  create_table "intakes", force: :cascade do |t|
    t.integer  "age_from"
    t.integer  "age_to"
    t.decimal  "amount",            precision: 19, scale: 2
    t.string   "period"
    t.integer  "unit_id"
    t.integer  "nutrition_fact_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "meals", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "light"
    t.boolean  "vegan"
    t.boolean  "raw"
    t.boolean  "gluten_free"
    t.boolean  "organic"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "restaurant_id"
  end

  add_index "meals", ["restaurant_id"], name: "index_meals_on_restaurant_id", using: :btree

  create_table "nutrition_facts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parent_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "short_description"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "product_ingredients", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "ingredient_id"
    t.integer  "percentage"
    t.integer  "weight"
    t.integer  "max_percentage"
    t.integer  "min_percentage"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "product_ingredients", ["ingredient_id"], name: "index_product_ingredients_on_ingredient_id", using: :btree
  add_index "product_ingredients", ["product_id"], name: "index_product_ingredients_on_product_id", using: :btree

  create_table "product_photos", force: :cascade do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "photo_type"
    t.json     "photo_meta"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "product_id"
  end

  add_index "product_photos", ["product_id"], name: "index_product_photos_on_product_id", using: :btree

  create_table "product_recipes", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "recipe_id"
    t.integer  "order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  add_index "product_recipes", ["product_id"], name: "index_product_recipes_on_product_id", using: :btree
  add_index "product_recipes", ["recipe_id"], name: "index_product_recipes_on_recipe_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",              precision: 8, scale: 2
    t.boolean  "primary"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "slug"
    t.integer  "weight"
    t.text     "serving_idea"
    t.text     "nutrition_fact"
    t.string   "ingredients"
    t.string   "short_description"
    t.string   "category"
  end

  add_index "products", ["slug"], name: "index_products_on_slug", using: :btree

  create_table "recipe_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.integer  "amount"
    t.integer  "unit_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "description"
    t.string   "amount_description"
  end

  add_index "recipe_ingredients", ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id", using: :btree
  add_index "recipe_ingredients", ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "how_to_cook"
    t.integer  "difficulty"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "cook_id"
    t.integer  "recipe_category_id"
    t.string   "url"
    t.string   "color"
    t.integer  "serving"
    t.string   "slug"
    t.boolean  "premium",            default: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "tag"
    t.string   "short_description"
    t.text     "nutrition_info"
  end

  add_index "recipes", ["slug"], name: "index_recipes_on_slug", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email"
    t.string   "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "domain"
    t.string   "uuid"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "smtp_username"
    t.string   "smtp_password_digest"
    t.string   "app_name"
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.string   "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.json     "tokens"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "addresses", "customers"
  add_foreign_key "cart_product_ingredients", "cart_products"
  add_foreign_key "cart_product_ingredients", "ingredients"
  add_foreign_key "cart_products", "carts"
  add_foreign_key "cart_products", "products"
  add_foreign_key "cart_transitions", "carts"
  add_foreign_key "carts", "coupons"
  add_foreign_key "carts", "customers"
  add_foreign_key "meals", "restaurants"
  add_foreign_key "product_ingredients", "ingredients"
  add_foreign_key "product_ingredients", "products"
  add_foreign_key "product_recipes", "products"
  add_foreign_key "product_recipes", "recipes"
end
