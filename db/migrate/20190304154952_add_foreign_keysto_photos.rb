class AddForeignKeystoPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :user_id, :integer
    add_foreign_key :photos, :users
    add_column :photos, :album_id, :integer
    add_foreign_key :photos, :albums
    add_column :photos, :post_id, :integer
    add_foreign_key :photos, :posts
  end
end
