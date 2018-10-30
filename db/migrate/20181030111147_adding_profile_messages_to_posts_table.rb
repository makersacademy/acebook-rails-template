# frozen_string_literal: true

class AddingProfileMessagesToPostsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :profile_message, :boolean, default: false
  end
end
