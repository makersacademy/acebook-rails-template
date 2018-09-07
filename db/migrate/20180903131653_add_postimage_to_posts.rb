# frozen_string_literal: true

class AddPostimageToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :postimage, :string
  end
end
