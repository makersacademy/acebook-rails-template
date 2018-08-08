class AddForeignKeyToLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :user_id, :integer
    add_column :likes, :post_id, :integer
    add_foreign_key :likes, :users
    add_foreign_key :likes, :posts
  end
end
