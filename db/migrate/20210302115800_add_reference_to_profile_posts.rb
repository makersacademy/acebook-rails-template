class AddReferenceToProfilePosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :profile_posts, :user, foreign_key: { to_table: :users }
    add_reference :profile_posts, :user_profile, foreign_key: { to_table: :users }
  end
end
