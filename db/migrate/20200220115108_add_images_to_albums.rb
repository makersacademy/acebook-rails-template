class AddImagesToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :images, :string, array: true, default: []
  end
end
