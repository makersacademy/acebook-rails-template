# frozen_string_literal: true

# Adds a user ID to all posts
class AddUserIdToposts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user, foreign_key: true
  end
end
