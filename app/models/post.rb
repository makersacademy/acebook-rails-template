require 'time'

class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  def likecount
    self.likes.count
  end

  def post_already_liked_by_current_user?(current_user)
    self.likes.find_by(user_id: current_user.id)
  end
end
