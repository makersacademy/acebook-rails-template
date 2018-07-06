class RemoveTitleFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :title, :string
  end
end
