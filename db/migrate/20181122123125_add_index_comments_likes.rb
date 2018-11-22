class AddIndexCommentsLikes < ActiveRecord::Migration[5.1]
  add_index :comment_likes, [:user_id, :comment_id], unique: true
end
