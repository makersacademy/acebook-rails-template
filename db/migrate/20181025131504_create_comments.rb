# frozen_string_literal: true

# Schema for the Comments table
class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.string :comment_text, null: false
      t.timestamps
    end
  end
end
