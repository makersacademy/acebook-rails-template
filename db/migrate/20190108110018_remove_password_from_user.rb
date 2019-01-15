# frozen_string_literal: true

class RemovePasswordFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :password, :string
  end
end
