# frozen_string_literal: true

class AddWallIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :wall_id, :integer
  end
end
