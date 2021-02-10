class AddColumnEmailToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string
    add_column :users, :mobile, :string
    add_column :users, :address, :string
    add_column :users, :url, :string
  end
end
