class AddImageToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image, :bytea
  end
end
