class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, null: false, default: ''
    add_column :users, :surname, :string, null: false, default: ''
  end
end
