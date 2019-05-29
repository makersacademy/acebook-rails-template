class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :message, presence: true

  def username
    user = User.find(user_id)
    "#{user.first_name} #{user.last_name}"
  end




end
