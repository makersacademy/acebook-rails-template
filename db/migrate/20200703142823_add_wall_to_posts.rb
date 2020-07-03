class AddWallToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :wall, foreign_key: { to_table: :users }
  end
end
