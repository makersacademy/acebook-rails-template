class AddModeratorToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :moderator, :boolean
    Users.where(:type => 'Mentor').update_all(:moderator => true)
  end


end
