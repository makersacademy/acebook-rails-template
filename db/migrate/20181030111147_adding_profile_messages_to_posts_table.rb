# frozen_string_literal: true

# We noe have a column to verify whether or not a post is private or public
class AddingProfileMessagesToPostsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :profile_message, :integer, default: 0
  end
end
