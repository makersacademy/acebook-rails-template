class Mentor < User
  has_many :students, class_name: 'Student', foreign_key: 'user_id'
  before_create :make_moderator

  def make_moderator
    self.moderator = true
  end
end
