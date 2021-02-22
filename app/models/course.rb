class Course < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  validates_presence_of :user_id, :title
  has_one_attached :main_image
end
