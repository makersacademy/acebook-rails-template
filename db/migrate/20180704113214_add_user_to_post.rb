class AddUserToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :user, :string
  end
end
