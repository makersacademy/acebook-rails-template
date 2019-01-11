class RemovePostidFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :postid, :integer
  end
end
