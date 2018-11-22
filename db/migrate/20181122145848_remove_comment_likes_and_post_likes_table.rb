class RemoveCommentLikesAndPostLikesTable < ActiveRecord::Migration[5.1]
  drop_table :comment_likes
  drop_table :post_likes
end
