class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.integer :user_id

      t.timestamps
    end
    add_foreign_key :friends, :users
  end
end
