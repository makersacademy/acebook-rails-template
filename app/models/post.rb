class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  before_create :set_stats
  validates :title, presence: true
  validates :message, presence: true

  def increment_views
    self.update(views: self.views + 1)
  end

  def increment_likes user_id
    self.likes = self.likes + 1
    self.liked_user_ids << user_id
    self.save
  end

  private

  def set_stats
    self.views = 0
    self.likes = 0
  end
end
