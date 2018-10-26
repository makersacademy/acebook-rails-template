class CreateImagePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :image_posts do |t|
      t.string :caption
      t.string :picture

      t.timestamps
    end
  end
end
