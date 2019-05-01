class RemoveLikerFromLikes < ActiveRecord::Migration[5.1]
  def change
    remove_column :likes, :liker, :integer
  end
end
