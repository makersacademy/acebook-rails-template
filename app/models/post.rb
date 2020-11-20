class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :delete_all
  has_many :likes, :dependent => :delete_all

  def simplifydate(date = self.created_at)
    return date.strftime('%d-%m-%Y')
  end

  def simplifytime(time = self.created_at)
    return time.strftime('%H:%M')
  end

  def comment(user, comment_text)
    comments << Comment.new(user: user, comment_text: comment_text)
  end

  def delete_comment(user)
    comments.where(user_id: user.id).first.destroy
  end

  def like(user)
    likes << Like.new(user: user)
  end

  def unlike(user)
    likes.where(user_id: user.id).first.destroy
  end
end
