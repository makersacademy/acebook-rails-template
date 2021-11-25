class ChangingLikesToInt < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :likes, :integer, using: 'likes::integer'
  end
end
