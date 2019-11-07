class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.exists?(post_id, user_id)
    Like.find_by(post_id: post_id, user_id: user_id)
  end

end
