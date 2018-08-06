class RenameColumnUsers < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :users, :password, :password_digest
  end
end
