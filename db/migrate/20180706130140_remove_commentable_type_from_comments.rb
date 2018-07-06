class RemoveCommentableTypeFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :commentable_type, :string
  end
end
