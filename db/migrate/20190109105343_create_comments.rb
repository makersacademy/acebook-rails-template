# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :userid
      t.integer :postid
      t.string :content

      t.timestamps
    end
  end
end
