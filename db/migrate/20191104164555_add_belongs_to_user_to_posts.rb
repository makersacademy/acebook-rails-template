class AddBelongsToUserToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user, index: true
  end
end
