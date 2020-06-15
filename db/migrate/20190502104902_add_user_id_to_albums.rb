class AddUserIdToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_reference :albums, :user, foreign_key: true
    change_column_null :albums, :user_id, false
  end
end
