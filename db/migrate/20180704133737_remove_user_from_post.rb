class RemoveUserFromPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :user, :string
  end
end
