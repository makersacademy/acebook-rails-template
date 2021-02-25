class AddUserIdToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user, column: :user_id, foreign_key: true
  end
end
