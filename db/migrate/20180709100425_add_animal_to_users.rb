class AddAnimalToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :animal, :string
  end
end
