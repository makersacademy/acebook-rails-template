# frozen_string_literal: true

class CreatePost < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :message

      t.timestamps
    end
  end
end
