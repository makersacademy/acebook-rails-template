class AddUniqueFriendRequest < ActiveRecord::Migration[5.1]
  def change
    add_index :friends, [:requester_id, :receiver_id], unique: true
  end
end
