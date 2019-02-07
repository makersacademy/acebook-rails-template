class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :user_id, presence: true
  validates :message, presence: true
end
