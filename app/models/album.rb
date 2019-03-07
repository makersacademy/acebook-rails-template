class Album < ApplicationRecord
  def self.default_album_exists?(current_user)
    users_default_album(current_user) != nil
  end

  def self.users_default_album(user)
    find_by(user_id: user.id, title: "#{user.first_name}'s Photos")
  end
end
