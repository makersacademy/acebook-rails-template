class AddProfilepicToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profilepic, :string
  end
end
