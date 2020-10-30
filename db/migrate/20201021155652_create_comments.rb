class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.bigint "post_id"
      t.index ["post_id"], name: "index_comments_on_post_id"
      t.bigint "user_id"
      t.index ["user_id"], name: "index_comments_on_user_id"

      t.timestamps
    end
  end
end
