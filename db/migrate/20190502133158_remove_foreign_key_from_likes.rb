class RemoveForeignKeyFromLikes < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :likes, column: :likeable_id
  end
end
