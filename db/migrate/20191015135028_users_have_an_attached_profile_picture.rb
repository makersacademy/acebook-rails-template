class UsersHaveAnAttachedProfilePicture < ActiveRecord::Migration[5.2]
  def change
    add_column :profile_pictures, :user_id, :integer
    add_foreign_key :profile_pictures, :users
  end
end
