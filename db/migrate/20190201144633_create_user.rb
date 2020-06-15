# frozen_string_literal: true

class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
      t.string :password_digest
    end
  end
end
