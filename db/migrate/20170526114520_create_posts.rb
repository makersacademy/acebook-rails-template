class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :text
      t.integer :poster_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
