class AddLikedUserIdstoPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :liked_user_ids, :integer, array:true, default: []
  end
end
