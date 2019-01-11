class AddFriendshipsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_id, :integer
    add_column :users, :friend_id, :integer
  end
end
