class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.text :message
      t.datetime :posted_on


      t.timestamps
    end
  end
end
