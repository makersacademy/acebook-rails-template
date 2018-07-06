class RemoveCommentableIdFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :commentable_id, :string
  end
end
