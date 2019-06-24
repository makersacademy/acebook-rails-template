class DropTablePosts < ActiveRecord::Migration[5.1]
  def change
    drop_table "posts", force: :cascade do |t|
      t.string "message"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
