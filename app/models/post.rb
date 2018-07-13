class Post < ApplicationRecord
  default_scope {order(created_at: :desc)}
  belongs_to :user
  has_many :likes
  has_many :comments

  def custom_time
    created_at.strftime("%H:%M %b %d, %Y")
  end
end
