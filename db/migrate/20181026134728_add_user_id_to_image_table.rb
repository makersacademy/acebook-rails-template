# frozen_string_literal: true

class AddUserIdToImageTable < ActiveRecord::Migration[5.1]
  def change
    add_column :image_posts, :user_id, :integer
  end
end
