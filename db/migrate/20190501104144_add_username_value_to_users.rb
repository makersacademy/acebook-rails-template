class AddUsernameValueToUsers < ActiveRecord::Migration[5.1]
  def change
    i = 0
    User.all.each do |user|
      i += 1
      user.update_attribute(:username, "AcebookUser#{i}")
    end
  end
end
