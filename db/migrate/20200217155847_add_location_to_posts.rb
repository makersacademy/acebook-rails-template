# frozen_string_literal: true

class AddLocationToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :location, foreign_key: { to_table: :users }
  end
end
