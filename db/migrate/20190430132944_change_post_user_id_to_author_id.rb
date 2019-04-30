class ChangePostUserIdToAuthorId < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :user_id, :author_id
    add_foreign_key :posts, :users, column: :author_id
  end
end
