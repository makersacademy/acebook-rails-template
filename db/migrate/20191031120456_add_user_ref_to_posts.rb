class AddUserRefToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user, foreign_key: true # add a constraint
  end
end
