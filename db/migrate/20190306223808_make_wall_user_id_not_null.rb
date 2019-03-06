class MakeWallUserIdNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :wall_user_id, :integer, :null => false
  end
end
