class Post < ApplicationRecord
  belongs_to :course
  validates_presence_of :course_id, :content
end
