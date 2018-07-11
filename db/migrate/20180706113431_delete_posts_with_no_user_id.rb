class DeletePostsWithNoUserId < ActiveRecord::Migration[5.1]
  def change
    Post.where(user_id: nil).destroy_all
  end
end
