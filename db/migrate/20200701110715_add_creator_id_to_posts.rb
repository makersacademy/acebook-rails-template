class AddCreatorIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :creator_id, :string
  end
end
