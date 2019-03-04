class AddUserReftoAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :user_id, :integer
    add_foreign_key :albums, :users
  end
end
