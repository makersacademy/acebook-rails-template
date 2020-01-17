class AddUserAssociationToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user
  end
end
