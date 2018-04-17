class Post < ApplicationRecord
  belongs_to :user, required: false
  has_many :comments, dependent: :destroy
  has_many :likes,  dependent: :destroy

  def owner?(user)
    self.user_id.to_i == user.id.to_i
  end

  def find_like(user)
    self.likes.find { |like| like.user_id.to_i == user.id.to_i}
  end

end
