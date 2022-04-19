class AddUserRefToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :username, :string
    #add_index :posts, :username, unique: true
    add_reference :posts, :user, foreign_key: true
  end
end
