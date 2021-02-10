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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20210209124730) do
=======
ActiveRecord::Schema.define(version: 20210209153305) do
>>>>>>> views

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "post_id"
    t.integer "user_id"
    t.string "content"
    t.datetime "created_at"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "content"
    t.datetime "created_at"
    t.integer "likes", default: 0
    t.integer "original_post_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "full_name"
    t.string "email"
    t.string "mobile"
    t.string "address"
    t.string "url"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "posts", "users"
end
