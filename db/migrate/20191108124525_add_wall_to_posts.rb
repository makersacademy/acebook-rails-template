class AddWallToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :wall_id, :bigint
  end
end
