class AddAgeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :age, :integer
    add_column :users, :owner, :string
  end
end
