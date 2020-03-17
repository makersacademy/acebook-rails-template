class CreateCommentLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_likes do |t|
      t.references :users, foreign_key: true
      t.references :comments, foreign_key: true 
      t.timestamps
    end
  end
end
