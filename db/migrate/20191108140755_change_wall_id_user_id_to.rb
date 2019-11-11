class ChangeWallIdUserIdTo < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :user_id, :bigint, null: false
    change_column :posts, :wall_id, :bigint, null: false
  end
end
