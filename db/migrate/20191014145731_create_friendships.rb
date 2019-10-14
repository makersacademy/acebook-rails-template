class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :user, null: false
      t.references :friend, null: false

      t.boolean :confirmed, default: false
      t.timestamps
    end
  end
end
