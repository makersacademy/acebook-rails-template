class RemovePiuaFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :post_img_updated_at, :datetime
  end
end
