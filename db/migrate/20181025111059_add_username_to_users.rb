# frozen_string_literal: true

# We can add our own Devise metrics, this one being username
class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
  end
end
