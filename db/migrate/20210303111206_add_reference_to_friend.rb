class AddReferenceToFriend < ActiveRecord::Migration[6.0]
  def change
    add_reference :friends, :friend_user, foreign_key: { to_table: :users }
  end
end
