class AddRealNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :real_name, :string
  end
end
