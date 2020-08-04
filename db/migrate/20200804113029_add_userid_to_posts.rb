class AddUseridToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :userid, :integer
  end
end
