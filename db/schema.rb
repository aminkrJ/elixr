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

ActiveRecord::Schema.define(version: 20170316045050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "slug"
    t.boolean  "published",   default: false
  end

  add_index "articles", ["category"], name: "index_articles_on_category", using: :btree
  add_index "articles", ["slug"], name: "index_articles_on_slug", using: :btree

  create_table "carts", force: :cascade do |t|
    t.decimal  "total"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "reference_number"
    t.string   "stripe_token"
    t.string   "status"
    t.integer  "customer_id"
  end

  add_index "carts", ["customer_id"], name: "index_carts_on_customer_id", using: :btree

  create_table "carts_products", id: false, force: :cascade do |t|
    t.integer "cart_id",    null: false
    t.integer "product_id", null: false
    t.integer "count"
  end

  add_index "carts_products", ["cart_id", "product_id"], name: "index_carts_products_on_cart_id_and_product_id", using: :btree
  add_index "carts_products", ["product_id", "cart_id"], name: "index_carts_products_on_product_id_and_cart_id", using: :btree

  create_table "cooks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "stripe_customer_id"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "zip"
    t.string   "state"
    t.string   "name_on_card"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "fullname"
    t.string   "email"
    t.string   "status"
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
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "amount"
    t.integer  "unit_id"
    t.string   "tags"
    t.boolean  "premium",                default: false
    t.integer  "ingredient_category_id"
    t.integer  "ph"
    t.boolean  "antioxidant"
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
    t.string   "subscribed_to"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
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

  add_foreign_key "carts", "customers"
  add_foreign_key "meals", "restaurants"
end
