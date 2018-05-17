class AddUserIdToWall < ActiveRecord::Migration[5.1]
  def change
    add_column :walls, :user_id, :integer 
  end
end
