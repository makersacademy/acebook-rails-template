class Album < ApplicationRecord

  def self.album_exists?(current_user)
    find_by(user_id: current_user.id) != nil
  end

end
