class Subscription < ApplicationRecord
  belongs_to :course
  belongs_to :user
  validates :course_id, uniqueness: { scope: :user_id }
  # Can't have course id and user id pair that repeats
end
