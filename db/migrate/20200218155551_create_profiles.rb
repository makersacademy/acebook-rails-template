# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :message
      t.references :posts, foreign_key: true
      t.references :users, foreign_key: true
      t.timestamps
    end
  end
end
