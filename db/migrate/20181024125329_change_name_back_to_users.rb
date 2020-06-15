class ChangeNameBackToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_table :admin_users, :users
  end
end
