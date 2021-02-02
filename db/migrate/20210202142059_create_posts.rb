class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      add_foreign_key :posts, :users
      t.text :post

      t.timestamps
      
    end
  end
end
