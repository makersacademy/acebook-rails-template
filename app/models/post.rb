class Post < ApplicationRecord

  def by_user?(user)
    user_id == user.id
  end

  def within_time?(minutes)
    (Time.current - created_at) <= (minutes * 60)
  end
end
