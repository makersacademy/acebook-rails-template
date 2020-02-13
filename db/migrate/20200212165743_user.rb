class User < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :email, :text, unique: true
  end
end
