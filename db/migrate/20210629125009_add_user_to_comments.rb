class AddUserToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user_id, :integer
    add_column :comments, :author, :string
  end
end
