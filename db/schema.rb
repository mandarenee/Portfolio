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

ActiveRecord::Schema.define(version: 20170610012519) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",               limit: 255
    t.integer  "author_id"
    t.boolean  "published"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
  end

  add_index "articles", ["slug"], name: "index_articles_on_slug"

  create_table "articles_categories", id: false, force: :cascade do |t|
    t.integer "article_id"
    t.integer "category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       limit: 255
    t.integer  "author_id"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug"

  create_table "categories_recipes", id: false, force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "category_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commenter_name",  limit: 255
    t.string   "commenter_url",   limit: 255
    t.string   "commenter_email", limit: 255
    t.string   "user_ip",         limit: 255
    t.string   "user_agent",      limit: 255
    t.string   "referrer",        limit: 255
    t.text     "content"
    t.boolean  "approved"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "ingredients", force: :cascade do |t|
    t.text     "item"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "technologies_used", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image",             limit: 255
    t.boolean  "image_processed"
  end

  create_table "recipe_tags", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_tags_recipes", id: false, force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "recipe_tag_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "author_id"
    t.boolean  "published"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.integer  "recipeYield"
    t.text     "instructions"
  end

  add_index "recipes", ["slug"], name: "index_recipes_on_slug"

  create_table "subscribers", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todo_items", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "finished"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "role"
    t.string   "name",                   limit: 255
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
