# frozen_string_literal: true

class AddUserIdColumnToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :user_id, :bigint
  end
end
