class ChangeFriendsIdColumnType < ActiveRecord::Migration[5.1]
  def change
    change_column :friendships, :friend_id, :string
  end
end
