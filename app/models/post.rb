class Post < ApplicationRecord

  include SessionsHelper

  belongs_to :user
  validates :user_id, presence: true
  validates :message, presence: true

  def username
    user = User.find(user_id)
    "#{user.first_name} #{user.last_name}"
  end

  def post_owner?(current_user_id)
    self.user_id == current_user_id
  end




end
