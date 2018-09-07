# frozen_string_literal: true

class DropUsersTable < ActiveRecord::Migration[5.1]
  def change
    drop_table(:users, if_exists: true)
  end
end
