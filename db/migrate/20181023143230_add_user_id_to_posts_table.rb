# frozen_string_literal: true

# adds user id to posts table
class AddUserIdToPostsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :user_id, :integer
  end
end
