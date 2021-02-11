class AddColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :views, :integer
    add_column :posts, :likes, :integer
  end
end
