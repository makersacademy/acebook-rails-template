class AddSurnameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :surname, :string
  end
end
