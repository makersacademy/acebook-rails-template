# frozen_string_literal: true

class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_reference :posts, :user, foreign_key: true
  end
end
