class AddWallIDtoPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :wall_id, :string
  end
end
