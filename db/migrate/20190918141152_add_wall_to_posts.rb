class AddWallToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :wall, foreign_key: true
  end
end
