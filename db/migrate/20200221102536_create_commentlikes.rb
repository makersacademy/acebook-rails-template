# frozen_string_literal: true

class CreateCommentlikes < ActiveRecord::Migration[5.1]
  def change
    create_table :commentlikes do |t|
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
