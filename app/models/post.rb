class Post < ApplicationRecord
  belongs_to :user, required: false
  has_many :comments, dependent: :destroy
  has_many :likes,  dependent: :destroy

  def owner_logged_in?(user)
    self.user_id.to_i == user.id.to_i
  end
end
