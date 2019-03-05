class ConfigUserName < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :user_name, unique: true
    change_column :users, :user_name, :string, :null => false
  end
end
