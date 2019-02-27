class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pronoun, :string
    add_column :users, :profile_pic, :string
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string
  end
end
