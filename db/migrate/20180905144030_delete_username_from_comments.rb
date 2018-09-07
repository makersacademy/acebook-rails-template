class DeleteUsernameFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :user_name
  end
end
