class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  def simplifydate(date = self.created_at)
    return date.strftime('%d-%m-%Y')
  end

  def simplifytime(time = self.created_at)
    return time.strftime('%H:%M')
  end

  def like(user)
    likes << Like.new(user: user)
  end

  def unlike(user)
    likes.where(user_id: user.id).first.destroy
  end
end
