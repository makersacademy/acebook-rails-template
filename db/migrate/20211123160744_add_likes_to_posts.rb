class AddLikesToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :likes, :string 
  end
end
