class AddUserIdToComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :name
    add_column :comments, :user_id, :integer, foreign_key: true
  end
end
