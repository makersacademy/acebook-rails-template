class AddOnToLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :likes, :on, :boolean
  end
end
