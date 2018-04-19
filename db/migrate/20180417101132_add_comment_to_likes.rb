class AddCommentToLikes < ActiveRecord::Migration[5.1]
  def change
    add_reference :likes, :comment, foreign_key: true
  end
end
