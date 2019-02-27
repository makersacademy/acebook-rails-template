class AddUserToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user, foreign_key: true, null: false
  end
end
