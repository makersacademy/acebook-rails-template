class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.references :friend, references: :users
      t.references :recipient_friend, references: :users
      t.boolean :confirmed_status, null: false, default: false  
      t.timestamps
    end
  end
end
