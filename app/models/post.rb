class Post < ApplicationRecord
  has_attached_file :image, styles: {
   thumb: '100x100>',
   square: '200x200#',
   medium: '300x300>',
   large: '600x600>'
 }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :message, presence: true
  belongs_to :user, required: false
  has_many :comments, dependent: :destroy
  has_many :likes,  dependent: :destroy

  def owner?(user)
    self.user_id.to_i == user.id.to_i
  end

  def likedisplay
    self.likes.count > 0 ? self.likes.count : ""
  end

  def commentdisplay
    self.comments.count > 0 ? self.comments.count : ""
  end

  def created_at_timestring
    self.created_at.localtime.strftime("%a %e %b %H:%M")
  end

  def timesort_comments
    self.comments.sort_by { |comment| comment.created_at }.reverse
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
