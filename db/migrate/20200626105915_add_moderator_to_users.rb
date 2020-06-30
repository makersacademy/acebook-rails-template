class AddModeratorToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :moderator, :boolean
  end
end
