# frozen_string_literal: true

class AddUserIdToImagePosts < ActiveRecord::Migration[5.1]
  def change
    add_column :image_posts, :user_id, :integer
  end
end
