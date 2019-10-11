class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :post
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
