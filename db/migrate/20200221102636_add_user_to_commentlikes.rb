# frozen_string_literal: true

class AddUserToCommentlikes < ActiveRecord::Migration[5.1]
  def change
    add_reference :commentlikes, :user, foreign_key: true
  end
end
