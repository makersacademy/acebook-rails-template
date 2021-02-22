class Rating < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates_presence_of :course_id, :user_id, :value
  validates :course_id, uniqueness: { scope: :user_id }

  validates :value, inclusion: 1..5

end
