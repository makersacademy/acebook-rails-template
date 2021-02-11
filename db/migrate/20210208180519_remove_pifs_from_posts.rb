class RemovePifsFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :post_img_file_size, :bigint
  end
end
