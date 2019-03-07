class Album < ApplicationRecord
  def self.default_album_exists?(current_user)
    find_by(user_id: current_user.id, title: "#{current_user.first_name}'s Photos") != nil
  end

  def self.users_default_album(current_user)
    find_by(user_id: current_user.id, title: "#{current_user.first_name}'s Photos")
  end
end
