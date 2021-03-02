# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :message
      t.timestamps
      add_reference :posts, :user, foreign_key: { to_table: :users }
    end
  end
end
