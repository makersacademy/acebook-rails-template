# frozen_string_literal: true

class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :surname, :string
    add_column :users, :username, :string
  end
end
