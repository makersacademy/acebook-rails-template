# frozen_string_literal: true

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
ActiveRecord::Schema.define(version: 20_170_526_114_520) do
=======
ActiveRecord::Schema.define(version: 20180830103256) do

>>>>>>> 5b35980c717e8d76d1944509b8ec7a5095246076
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

<<<<<<< HEAD
  create_table 'posts', force: :cascade do |t|
    t.string 'message'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
=======
  create_table "posts", force: :cascade do |t|
    t.string "message"
    t.string "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
>>>>>>> 5b35980c717e8d76d1944509b8ec7a5095246076
  end
end
