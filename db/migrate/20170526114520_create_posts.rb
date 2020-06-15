# frozen_string_literal: true

# This class just tells ActiveRecord how to create/migrate the database.
class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :message

      t.timestamps
    end
  end
end
