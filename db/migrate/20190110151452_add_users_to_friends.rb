class AddUsersToFriends < ActiveRecord::Migration[5.1]
  def change
    add_reference :friends, :user, foreign_key: true
  end
end
