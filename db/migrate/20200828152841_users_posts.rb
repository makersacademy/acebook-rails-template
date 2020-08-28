class UsersPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :users_posts, id: false do |t|
      t.integer :user
      t.integer :post
    end
  end
end
