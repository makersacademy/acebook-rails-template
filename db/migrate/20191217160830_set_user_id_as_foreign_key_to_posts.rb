# frozen_string_literal: true

class SetUserIdAsForeignKeyToPosts < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :posts, :users
    change_column_null :posts, :user_id, false
  end
end
