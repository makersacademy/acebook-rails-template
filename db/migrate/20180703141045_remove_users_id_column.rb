class RemoveUsersIdColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :users_id
  end
end
