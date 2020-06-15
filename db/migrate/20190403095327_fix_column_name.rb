class FixColumnName < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :signups, :password, :password_digest
  end
end
