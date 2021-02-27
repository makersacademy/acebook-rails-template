class UserId < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user, foreign_key: { to_table: :users }
  end
end
