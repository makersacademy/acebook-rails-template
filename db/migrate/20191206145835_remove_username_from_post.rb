class RemoveUsernameFromPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :username, :string
  end
end
