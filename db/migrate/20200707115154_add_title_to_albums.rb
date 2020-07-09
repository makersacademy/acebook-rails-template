class AddTitleToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :title, :string
  end
end
