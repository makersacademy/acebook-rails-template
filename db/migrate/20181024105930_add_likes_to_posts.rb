# frozen_string_literal: true

## This migration allowed us to add the likeCount to the Post Table
class AddLikesToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :likeCount, :integer, default: 0
  end
end
