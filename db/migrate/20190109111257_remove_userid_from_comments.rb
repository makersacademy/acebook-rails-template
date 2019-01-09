class RemoveUseridFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :userid, :integer
  end
end
