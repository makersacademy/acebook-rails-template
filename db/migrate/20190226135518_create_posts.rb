class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :users, index: true, foreign_key: true, null: false
      t.string :message, null: false

      t.timestamps
    end
  end
end
