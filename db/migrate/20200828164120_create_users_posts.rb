class CreateUsersPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :users_posts, id: false do |t|
      t.references :user_id, index: true, foreign_key: true
      t.references :post_id, index: true, foreign_key: true
    end
  end
end
