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

ActiveRecord::Schema.define(version: 20160221191539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: true do |t|
    t.string   "title",                          null: false
    t.text     "body"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",     default: "pending"
    t.datetime "posted_at"
    t.string   "slug"
  end

  add_index "blogs", ["slug"], name: "index_blogs_on_slug", using: :btree

  create_table "blogs_tags", force: true do |t|
    t.integer "blog_id"
    t.integer "tag_id"
  end

  create_table "books", force: true do |t|
    t.integer "blog_id"
    t.integer "stars",   null: false
    t.integer "gr_id"
  end

  create_table "entries", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patterns", force: true do |t|
    t.string  "name",                 null: false
    t.string  "company"
    t.integer "stars",    default: 0, null: false
    t.text    "review"
    t.string  "man_link"
    t.string  "slug"
  end

  add_index "patterns", ["slug"], name: "index_patterns_on_slug", using: :btree

  create_table "photos", force: true do |t|
    t.string  "filename",                   null: false
    t.integer "blog_id"
    t.integer "project_id"
    t.boolean "fizz",       default: false, null: false
    t.string  "credits",    default: ""
  end

  create_table "photos_tags", force: true do |t|
    t.integer "photo_id"
    t.integer "tag_id"
  end

  create_table "projects", force: true do |t|
    t.string   "name",              null: false
    t.string   "short_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "projects", ["slug"], name: "index_projects_on_slug", using: :btree

  create_table "projects_tags", force: true do |t|
    t.integer "project_id"
    t.integer "tag_id"
  end

  create_table "recommendations", force: true do |t|
    t.string   "title",                           null: false
    t.string   "author",                          null: false
    t.string   "recommender",                     null: false
    t.integer  "book_id"
    t.string   "status",      default: "pending", null: false
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string "tag"
    t.string "tag_type"
    t.string "slug"
  end

  add_index "tags", ["slug"], name: "index_tags_on_slug", using: :btree

end
