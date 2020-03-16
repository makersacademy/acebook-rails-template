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

ActiveRecord::Schema.define(version: 20200316145041) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment_likes", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "comments_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comments_id"], name: "index_comment_likes_on_comments_id"
    t.index ["users_id"], name: "index_comment_likes_on_users_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.bigint "users_id"
    t.bigint "posts_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["posts_id"], name: "index_comments_on_posts_id"
    t.index ["users_id"], name: "index_comments_on_users_id"
  end

  create_table "post_likes", force: :cascade do |t|
    t.bigint "posts_id"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["posts_id"], name: "index_post_likes_on_posts_id"
    t.index ["users_id"], name: "index_post_likes_on_users_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "message"
    t.bigint "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_posts_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
  end

  add_foreign_key "comment_likes", "comments", column: "comments_id"
  add_foreign_key "comment_likes", "users", column: "users_id"
  add_foreign_key "comments", "posts", column: "posts_id"
  add_foreign_key "comments", "users", column: "users_id"
  add_foreign_key "post_likes", "posts", column: "posts_id"
  add_foreign_key "post_likes", "users", column: "users_id"
  add_foreign_key "posts", "users", column: "users_id"
end
