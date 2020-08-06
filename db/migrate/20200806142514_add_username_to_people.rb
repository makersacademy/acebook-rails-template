class AddUsernameToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :username, :string
  end
end
