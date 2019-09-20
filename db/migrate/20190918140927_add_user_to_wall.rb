class AddUserToWall < ActiveRecord::Migration[5.1]
  def change
    add_reference :walls, :user, foreign_key: true
  end
end
