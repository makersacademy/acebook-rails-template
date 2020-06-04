class AddUserIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :user_id, :integer
    # add_foreign_key :posts, :user_id
  end
end
