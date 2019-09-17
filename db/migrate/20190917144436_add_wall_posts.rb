class AddWallPosts < ActiveRecord::Migration[5.1]
  def change
    add_column(:posts, :to_user_id, :bigint, null: true)
    add_index(:posts, :to_user_id)
    add_foreign_key(:posts, :users, column: :to_user_id)
  end
end
