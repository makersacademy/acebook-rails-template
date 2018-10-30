class AddUserIdToWallPost < ActiveRecord::Migration[5.1]
  def change
    add_column :wall_posts, :user_id, :integer
  end
end
