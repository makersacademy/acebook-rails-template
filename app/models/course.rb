class Course < ApplicationRecord
  belongs_to :user

  has_many :posts, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates_presence_of :user_id, :title
  has_one_attached :main_image

  def get_course_user_name
    user = User.find(self.user_id)
    return user ? user.username : ""
  end
end
