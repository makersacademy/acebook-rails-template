class RemoveIdPostsLikes < ActiveRecord::Migration[5.1]
  remove_column :post_likes, :id
end
