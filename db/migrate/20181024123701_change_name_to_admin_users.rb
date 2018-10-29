# frozen_string_literal: true

class ChangeNameToAdminUsers < ActiveRecord::Migration[5.1]
  def change
    rename_table :users, :admin_users
  end
end
