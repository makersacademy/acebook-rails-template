class Post < ApplicationRecord
  belongs_to :course
  has_rich_text :content
  validates_presence_of :course_id, :title, :content
  before_create :set_position

  def set_position
    last_max_position = Post.where(course_id: self.course_id).maximum("position")
    self.position ||= last_max_position.to_i + 1
  end
end
