class CreatePostLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :post_likes do |t|
      t.references :posts, foreign_key: true
      t.references :users, foreign_key: true
      t.timestamps
    end
  end
end
