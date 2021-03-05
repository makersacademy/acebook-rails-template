class CreateProfilePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_posts do |t|
      t.string :message

      t.timestamps

    end
  end
end
