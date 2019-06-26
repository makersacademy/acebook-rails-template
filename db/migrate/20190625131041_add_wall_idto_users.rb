class AddWallIdtoUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :wall_id, :serial
  end
end
