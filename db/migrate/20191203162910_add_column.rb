class AddColumn < ActiveRecord::Migration[5.1]
  def change
     add_column :users, :first_name, :string, limit: 50
      add_column :users, :surname, :string, limit: 50
  end
end
