class AddUserToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user, foreign_key: true
  end

  add_index :posts, :user_id
end
