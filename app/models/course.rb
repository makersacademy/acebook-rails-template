class Course < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  validates_presence_of :user_id, :title
end
