# frozen_string_literal: true

# Creates an image comments table
class AddCommentsToImages < ActiveRecord::Migration[5.1]
  def change
    create_table :image_comments do |t|
      t.integer :image_post_id
      t.integer :user_id
      t.string  :comment

      t.timestamps
    end
  end
end
