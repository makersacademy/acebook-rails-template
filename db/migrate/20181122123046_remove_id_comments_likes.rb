class RemoveIdCommentsLikes < ActiveRecord::Migration[5.1]
  remove_column :comment_likes, :id
end
