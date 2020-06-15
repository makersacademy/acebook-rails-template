class AddIndexPostLikes < ActiveRecord::Migration[5.1]
  add_index :post_likes, [:user_id, :post_id], unique: true
end
