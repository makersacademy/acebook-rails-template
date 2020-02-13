class AddUserIdToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :users, foreign_key: true, index: true
  end
end
