# frozen_string_literal: true

class ChangePasswordColumnName < ActiveRecord::Migration[5.1]
  def up
    rename_column :users, :password, :password_digest
  end

  def down
    rename_column :users, :password_digest, :password
  end
end
