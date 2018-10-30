class RemoveUserIdFromWallPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :wall_posts, :user_id, :integer
  end
end
