class AddProfilePictoUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :photo_id, :integer
    add_foreign_key :users, :photos
  end
end
