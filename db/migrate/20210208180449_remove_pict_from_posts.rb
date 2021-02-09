class RemovePictFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :post_img_content_type, :string
  end
end
