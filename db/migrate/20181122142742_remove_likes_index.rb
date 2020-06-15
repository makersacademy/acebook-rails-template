class RemoveLikesIndex < ActiveRecord::Migration[5.1]
  remove_index :likes, [:likeable_type, :likeable_id, :user_id]
end
