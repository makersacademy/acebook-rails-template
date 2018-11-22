# Adds user refs to Posts
class AddUserRefToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user, foreign_key: true
  end
end

# rails g migration AddUserRefToPosts user:references
