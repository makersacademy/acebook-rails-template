class AddPostToLike < ActiveRecord::Migration[5.1]
  def change
    add_reference :likes, :post, foreign_key: true, null:false
  end
end
