class DropWallsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :walls
  end
end
