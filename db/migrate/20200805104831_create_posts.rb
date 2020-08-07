class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|

      t.timestamps
    end
    add_reference :posts, :person, foreign_key: true
  end
end
