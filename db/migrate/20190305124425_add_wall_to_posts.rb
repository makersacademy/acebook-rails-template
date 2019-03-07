class AddWallToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :wall, :integer
  end
end
