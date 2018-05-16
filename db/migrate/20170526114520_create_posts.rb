# frozen_string_literal: true

# db migration for posts controller
class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :message

      t.timestamps
    end
  end
end
