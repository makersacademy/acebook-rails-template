class RemovePasswordFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :password
    remove_column :users, :confirm_password
    add_column :users, :name
    add_column :users, :email
    add_column :users, :password_digest
  end
end
