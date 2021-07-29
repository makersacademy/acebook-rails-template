class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :location, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :interests, :string
    add_column :users, :about_me, :string
  end
end
