class Post < ApplicationRecord
  validates :message, presence: true
  belongs_to :user, required: false
  has_many :comments, dependent: :destroy
  has_many :likes,  dependent: :destroy

  def owner?(user)
    self.user_id.to_i == user.id.to_i
  end

  def like_count_string
    if self.likes.length > 0
      return "#{self.likes.length} #{self.likes.length ==1 ? "Like" : "Likes" }"
    end
  end

  def comment_count_string
    if self.comments.length > 0
      return "#{self.comments.length} #{self.comments.length ==1 ? "Comment" : "Comments" }"
    end
  end

  def created_at_timestring
    self.created_at.localtime.strftime("%a %e %b %H:%M")
  end

  def timesort_comments
    self.comments.sort_by { |comment| comment.created_at || 0}.reverse
  end

  def find_like(user)
    self.likes.find { |like| like.user_id.to_i == user.id.to_i}
  end

  def self.time_sort_all
    self.all.sort_by { |post| post.created_at }.reverse
  end

  def author
    User.find(self.user_id.to_i).identifier
  end
end
