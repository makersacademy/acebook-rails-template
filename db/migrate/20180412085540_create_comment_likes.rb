# frozen_string_literal: true

class CreateCommentLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_likes do |t|
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
